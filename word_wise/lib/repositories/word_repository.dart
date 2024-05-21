import 'package:word_wise/dto/word_detail_dto.dart';

abstract class IWordRepository {
  Future<List<String>> getWords();

  Future<List<String>> getWordsHistory();

  Future<WordDetailDto> getWordDetail({required String word});

  Future<List<String>> favoriteWord({required String word});

  Future<List<String>> unFavoriteWord({required String word});
}
