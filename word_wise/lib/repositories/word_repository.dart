import 'package:word_wise/dto/word_detail_dto.dart';
import 'package:word_wise/services/favorite_service.dart';
import 'package:word_wise/services/history_service.dart';
import 'package:word_wise/services/word_definition_service.dart';
import 'package:word_wise/services/word_service.dart';

class WordRepository {
  final HistoryService historicService;
  final FavoriteService favoriteService;
  final WordService wordService;
  final WordDefinitionService wordDefinitionService;

  WordRepository({
    required this.historicService,
    required this.favoriteService,
    required this.wordService,
    required this.wordDefinitionService,
  });

  Future<void> favoriteWord({required String userId, required String word}) async {
    await favoriteService.addFavorite(word: word, userId: userId);
  }

  Future<void> unFavoriteWord({required String userId, required String word}) async {
    await favoriteService.removeFavorite(word: word, userId: userId);
  }

  Future<List<String>> getFavoriteWords({required String userId}) async {
    return await favoriteService.getFavorites(userId: userId);
  }

  Future<WordDetailDto> getWordDefinition({required String word}) async {
    return await wordDefinitionService.getDefinitionFromApi(word: word);
  }

  Future<List<String>> getWords({required int itensFetched}) async {
    return await wordService.getWords(itensFetched: itensFetched);
  }

  Future<List<String>> getHistory({required String userId}) async {
    return await historicService.getHistory(userId: userId);
  }

  Future<void> registerHistoryVisit({required String word, required String userId}) async {
    return await historicService.registerVisit(word: word, userId: userId);
  }

  Future<void> clearHistory({required String userId}) async {
    await historicService.clearHistory(userId: userId);
  }
}
