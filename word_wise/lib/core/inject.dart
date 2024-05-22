import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:word_wise/core/logger.dart';
import 'package:word_wise/repositories/word_repository.dart';
import 'package:word_wise/services/api_service.dart';
import 'package:word_wise/services/cache_service.dart';

GetIt inject = GetIt.instance;

Future<void> setupInjection() async {
  WWLogger.i(message: 'Reset injection');

  await inject.reset();

  final cache = await CacheService.setupHive();

  String _supabaseUrl = '';
  String _supabaseAnonKey = '';
  const String fileName = '.env';

  try {
    await dotenv.load(fileName: fileName);
    _supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
    _supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';
    if (_supabaseUrl.isEmpty) WWLogger.w(message: '"SUPABASE_URL" was not found on ".env" file');
    if (_supabaseAnonKey.isEmpty) WWLogger.w(message: '"SUPABASE_ANON_KEY" was not found on ".env" file');
  } catch (exception) {
    WWLogger.e(message: 'Fail to load environment keys, file: "$fileName" not found!', exception: exception);
  }

  await Supabase.initialize(url: _supabaseUrl, anonKey: _supabaseAnonKey);

  inject.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  inject.registerLazySingleton<CacheService>(() => CacheService(hiveBox: cache));

  inject.registerLazySingleton<APIService>(() => APIService(dio: inject<Dio>()));

  inject.registerLazySingleton<WordRepository>(() => WordRepository(apiService: inject<APIService>(), cacheService: inject<CacheService>()));

  inject.registerLazySingleton<Dio>(() => Dio(
        BaseOptions(
          baseUrl: 'https://api.dictionaryapi.dev/api/v2/entries/en/',
          headers: {'Content-Type': 'application/json'},
        ),
      ));

  WWLogger.i(message: 'Setup injection finished');
}
