import 'package:bloc/bloc.dart';
import 'package:word_wise/app/features/word_definition_page/word_definition_state.dart';
import 'package:word_wise/core/logger.dart';
import 'package:word_wise/dto/word_detail_dto.dart';
import 'package:word_wise/repositories/word_repository.dart';

class WordDefinitionCubit extends Cubit<WordDefinitionState> {
  final WordRepository repository;
  WordDefinitionCubit({required this.repository}) : super(const WordDefinitionState.loading());
  WordDetailDto? wordDefinition;

  Future<void> load({required String word}) async {
    try {
      emit(const WordDefinitionState.loading());
      WWLogger.l(message: 'Loading history');
      wordDefinition = await repository.getWordDefinition(word: word);
      if (wordDefinition != null) {
        WWLogger.l(message: 'Fetched details of ${wordDefinition!.word}');
        emit(WordDefinitionState.content(wordDetail: wordDefinition!));
      }
    } catch (exception, stackTrace) {
      WWLogger.e(message: exception.toString(), exception: exception, stackTrace: stackTrace);
      emit(const WordDefinitionState.error());
    }
  }
}
