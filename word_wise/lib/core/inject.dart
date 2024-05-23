import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:word_wise/app/features/words_page/words_cubit.dart';
import 'package:word_wise/core/logger.dart';
import 'package:word_wise/core/wrappers/supabase_wrapper.dart';
import 'package:word_wise/repositories/word_repository.dart';
import 'package:word_wise/services/cache_service.dart';
import 'package:word_wise/services/favorite_service.dart';
import 'package:word_wise/services/history_service.dart';
import 'package:word_wise/services/word_definition_service.dart';
import 'package:word_wise/services/word_service.dart';

GetIt inject = GetIt.instance;

Future<void> setupInjection() async {
  WWLogger.i(message: 'Reset injection');

  await inject.reset();

  final cache = await CacheService.setupHive();

  String supabaseUrl = '';
  String supabaseAnonKey = '';
  const String fileName = '.env';

  try {
    await dotenv.load(fileName: fileName);
    supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
    supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'] ?? '';
    if (supabaseUrl.isEmpty) WWLogger.w(message: '"SUPABASE_URL" was not found on ".env" file');
    if (supabaseAnonKey.isEmpty) WWLogger.w(message: '"SUPABASE_ANON_KEY" was not found on ".env" file');
  } catch (exception) {
    WWLogger.e(message: 'Fail to load environment keys, file: "$fileName" not found!', exception: exception);
  }

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey, debug: false);

  inject.registerLazySingleton<WordsCubit>(() => WordsCubit(repository: inject<WordRepository>()));

  inject.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  inject.registerLazySingleton<SupabaseWrapper>(() => SupabaseWrapper(supabaseClient: inject<SupabaseClient>()));

  inject.registerLazySingleton<CacheService>(() => CacheService(hiveBox: cache));

  inject.registerLazySingleton<WordDefinitionService>(() => WordDefinitionService(dio: inject<Dio>()));

  inject.registerLazySingleton<WordService>(() => WordService(supabaseWrapper: inject<SupabaseWrapper>()));

  inject.registerLazySingleton<HistoryService>(() => HistoryService(supabaseWrapper: inject<SupabaseWrapper>()));

  inject.registerLazySingleton<FavoriteService>(() => FavoriteService(supabaseWrapper: inject<SupabaseWrapper>()));

  inject.registerLazySingleton<WordRepository>(() => WordRepository(
        historyService: inject<HistoryService>(),
        favoriteService: inject<FavoriteService>(),
        wordService: inject<WordService>(),
        wordDefinitionService: inject<WordDefinitionService>(),
      ));

  inject.registerLazySingleton<Dio>(() => Dio(
        BaseOptions(
          baseUrl: 'https://api.dictionaryapi.dev/api/v2/entries/en/',
          headers: {'Content-Type': 'application/json'},
        ),
      ));

  WWLogger.i(message: 'Setup injection finished');
}
