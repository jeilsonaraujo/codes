import 'package:word_wise/dto/word_detail_dto.dart';
import 'package:word_wise/services/api_service.dart';
import 'package:word_wise/services/cache_service.dart';

class WordRepository {
  final APIService apiService;
  final CacheService cacheService;

  WordRepository({required this.apiService, required this.cacheService});

  Future<List<String>> favoriteWord({required String word}) {
    // TODO: implement favoriteWord
    throw UnimplementedError();
  }

  Future<List<String>> unFavoriteWord({required String word}) {
    // TODO: implement unFavoriteWord
    throw UnimplementedError();
  }

  Future<WordDetailDto> getWordDetail({required String word}) async {
    WordDetailDto? wordDetail = await cacheService.getWordDetailCache(path: word);
    if (wordDetail == null) {
      wordDetail = await apiService.getDefinition(word: word);
      cacheService.setWordDetailCache(path: word, wordDetail: wordDetail);
    }
    return wordDetail;
  }

  Future<List<String>> getWords() {
    // TODO: implement getWords
    throw UnimplementedError();
  }

  Future<List<String>> getWordsHistory() {
    // TODO: implement getWordsHistory
    throw UnimplementedError();
  }
}
