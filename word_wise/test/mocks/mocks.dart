import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:word_wise/services/word_definition_service.dart';

export 'package:flutter_test/flutter_test.dart';

export 'supabase_wrapper_mock.dart';

class DioMock extends Mock implements Dio {}

class WordDefinitionServiceMock extends Mock implements WordDefinitionService {}
