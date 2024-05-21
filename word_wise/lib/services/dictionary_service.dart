import 'package:dio/dio.dart';
import 'package:word_wise/dto/word_detail_dto.dart';

class DictionaryService {
  final Dio dio;

  DictionaryService({required this.dio});

  Future<WordDetailDto> getDefinition({required String word}) async {
    final result = await dio.get('/en/$word');
    final data = WordDetailDto.fromJson(result.data[0]);

    return data;
  }
}
