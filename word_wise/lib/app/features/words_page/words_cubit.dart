import 'package:bloc/bloc.dart';
import 'package:word_wise/app/features/words_page/words_state.dart';
import 'package:word_wise/core/logger.dart';
import 'package:word_wise/repositories/word_repository.dart';

class WordsCubit extends Cubit<WordsState> {
  final WordRepository repository;
  WordsCubit({required this.repository}) : super(const WordsState.loading());
  List<String> words = [];

  Future<void> load() async {
    try {
      emit(const WordsState.loading());
      WWLogger.l(message: 'Loading words');
      words = await repository.getWords(itensFetched: words.length);
      WWLogger.l(message: 'Fetched ${words.length} words');
      words.isEmpty ? emit(const WordsState.empty()) : emit(WordsState.content(words: words));
    } catch (exception, stackTrace) {
      WWLogger.e(message: exception.toString(), exception: exception, stackTrace: stackTrace);
      emit(const WordsState.error());
    }
  }

  Future<void> paginate() async {
    try {
      emit(WordsState.paginating(words: words));
      WWLogger.l(message: 'Paginating words');
      final paginatedWords = await repository.getWords(itensFetched: words.length);
      words.addAll(paginatedWords);
      WWLogger.l(message: 'Fetched +${paginatedWords.length} words');
      WWLogger.l(message: 'Total of words: ${words.length}');
      emit(WordsState.content(words: words));
    } catch (exception, stackTrace) {
      WWLogger.e(message: exception.toString(), exception: exception, stackTrace: stackTrace);
      emit(const WordsState.error());
    }
  }
}
