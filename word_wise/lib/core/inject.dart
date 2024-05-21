import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt inject = GetIt.instance;

Future<void> setupInjection() async {
  await inject.reset();

  inject.registerLazySingleton<Dio>(
      instanceName: 'dictionaryApi',
      () => Dio(
            BaseOptions(
              baseUrl: 'https://api.dictionaryapi.dev/api/v2/entries',
              headers: {'Content-Type': 'application/json'},
            ),
          ));
}
