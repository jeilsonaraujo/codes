import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:word_wise/app/features/favorites_page/favorites_cubit.dart';
import 'package:word_wise/app/features/history_page/history_cubit.dart';
import 'package:word_wise/app/features/word_definition_page/word_definition_cubit.dart';
import 'package:word_wise/app/features/words_page/words_cubit.dart';
import 'package:word_wise/core/logger.dart';
import 'package:word_wise/core/routes.dart';
import 'package:word_wise/repositories/word_repository.dart';
import 'package:word_wise/services/cache_service.dart';
import 'package:word_wise/services/favorite_service.dart';
import 'package:word_wise/services/history_service.dart';
import 'package:word_wise/services/word_definition_service.dart';
import 'package:word_wise/services/word_service.dart';
import 'package:word_wise/wrappers/dio_wrapper.dart';
import 'package:word_wise/wrappers/hive_wrapper.dart';
import 'package:word_wise/wrappers/supabase_wrapper.dart';

GetIt inject = GetIt.instance;

Future<void> setupInjection() async {
  WWLogger.i(message: 'Reset injection');

  await inject.reset();

  final cache = await HiveWrapper.openBox(boxName: 'apiCache', timeToLiveCacheInHours: 2);

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

  inject.registerLazySingleton<HistoryCubit>(() => HistoryCubit(repository: inject<WordRepository>()));

  inject.registerLazySingleton<WordDefinitionCubit>(() => WordDefinitionCubit(repository: inject<WordRepository>(), cacheService: inject<CacheService>()));

  inject.registerLazySingleton<FavoritesCubit>(() => FavoritesCubit(repository: inject<WordRepository>()));

  inject.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  inject.registerLazySingleton<SupabaseWrapper>(() => SupabaseWrapper(supabaseClient: inject<SupabaseClient>()));

  inject.registerLazySingleton<DioWrapper>(() => DioWrapper(dio: inject<Dio>()));

  inject.registerLazySingleton<HiveWrapper>(() => HiveWrapper(box: cache));

  inject.registerLazySingleton<CacheService>(() => CacheService(hiveWrapper: inject<HiveWrapper>()));

  inject.registerLazySingleton<WordDefinitionService>(() => WordDefinitionService(dioWrapper: inject<DioWrapper>()));

  inject.registerLazySingleton<WordService>(() => WordService(supabaseWrapper: inject<SupabaseWrapper>()));

  inject.registerLazySingleton<HistoryService>(() => HistoryService(supabaseWrapper: inject<SupabaseWrapper>()));

  inject.registerLazySingleton<FavoriteService>(() => FavoriteService(supabaseWrapper: inject<SupabaseWrapper>()));

  inject.registerLazySingleton<AppRouter>(() => AppRouter());

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
