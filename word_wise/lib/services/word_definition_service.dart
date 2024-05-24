import 'package:word_wise/core/logger.dart';
import 'package:word_wise/dto/word_detail_dto.dart';
import 'package:word_wise/wrappers/dio_wrapper.dart';

class WordDefinitionService {
  final DioWrapper dioWrapper;

  WordDefinitionService({required this.dioWrapper});

  Future<WordDetailDto> getDefinitionFromApi({required String word}) async {
    WWLogger.i(message: 'Fetching word:"$word" from API');

    final data = await dioWrapper.get(word);
    return WordDetailDto.fromJson(data[0]);
  }
}
