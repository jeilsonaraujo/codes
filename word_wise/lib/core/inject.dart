import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:word_wise/repositories/word_repository.dart';
import 'package:word_wise/services/api_service.dart';
import 'package:word_wise/services/cache_service.dart';

GetIt inject = GetIt.instance;

Future<void> setupInjection() async {
  await inject.reset();

  final cache = await CacheService.setupHive();

  inject.registerLazySingleton<CacheService>(() => CacheService(hiveBox: cache));

  inject.registerLazySingleton<APIService>(() => APIService(dio: inject<Dio>()));

  inject.registerLazySingleton<WordRepository>(() => WordRepository(apiService: inject<APIService>(), cacheService: inject<CacheService>()));

  inject.registerLazySingleton<Dio>(() => Dio(
        BaseOptions(
          baseUrl: 'https://api.dictionaryapi.dev/api/v2/entries/en/',
          headers: {'Content-Type': 'application/json'},
        ),
      ));
}
