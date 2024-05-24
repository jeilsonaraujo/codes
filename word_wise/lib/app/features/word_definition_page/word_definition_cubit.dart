import 'package:bloc/bloc.dart';
import 'package:word_wise/app/features/word_definition_page/word_definition_state.dart';
import 'package:word_wise/core/logger.dart';
import 'package:word_wise/dto/word_detail_dto.dart';
import 'package:word_wise/repositories/word_repository.dart';
import 'package:word_wise/services/cache_service.dart';

class WordDefinitionCubit extends Cubit<WordDefinitionState> {
  final WordRepository repository;
  final CacheService cacheService;
  WordDefinitionCubit({required this.repository, required this.cacheService}) : super(const WordDefinitionState.loading());
  WordDetailDto? wordDefinition;

  Future<void> load({required String word}) async {
    try {
      emit(const WordDefinitionState.loading());
      WWLogger.l(message: 'Loading history');
      wordDefinition = await getFirstFromCache(word: word);
      if (wordDefinition != null) {
        WWLogger.l(message: 'Fetched details of ${wordDefinition!.word}');
        registerHistory(word: word, userId: 'b57e89bf-279b-4edb-904d-b6da662a37a2');
        emit(WordDefinitionState.content(wordDetail: wordDefinition!));
      }
    } catch (exception, stackTrace) {
      WWLogger.e(message: exception.toString(), exception: exception, stackTrace: stackTrace);
      emit(const WordDefinitionState.error());
    }
  }

  void registerHistory({required String word, required String userId}) {
    repository.registerHistoryVisit(word: word, userId: userId);
  }

  Future<WordDetailDto> getFirstFromCache({required String word}) async {
    WordDetailDto? response;

    response = await cacheService.getFromCache(key: word);
    if (response != null) {
      WWLogger.i(message: '"$word" was found stored on cache');
      return response;
    }
    WWLogger.i(message: '"$word" not found stored on cache');
    response = await repository.getWordDefinition(word: word);
    await cacheService.putOnCache(key: word, value: response);
    WWLogger.i(message: 'Word: "$word" stored on cache');
    return response;
  }
}
