import 'package:bloc/bloc.dart';
import 'package:word_wise/app/features/history_page/history_state.dart';
import 'package:word_wise/core/logger.dart';
import 'package:word_wise/repositories/word_repository.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final WordRepository repository;
  HistoryCubit({required this.repository}) : super(const HistoryState.loading());
  List<String> words = [];

  Future<void> load() async {
    try {
      words.clear();
      emit(const HistoryState.loading());
      WWLogger.l(message: 'Loading history');
      words = await repository.getHistory(userId: 'b57e89bf-279b-4edb-904d-b6da662a37a2');
      WWLogger.l(message: 'Fetched ${words.length} history');
      words.isEmpty ? emit(const HistoryState.empty()) : emit(HistoryState.content(words: words));
    } catch (exception, stackTrace) {
      WWLogger.e(message: exception.toString(), exception: exception, stackTrace: stackTrace);
      emit(const HistoryState.error());
    }
  }

  Future<void> paginate() async {
    try {
      emit(HistoryState.paginating(words: words));
      WWLogger.l(message: 'Paginating words');
      final paginatedWords = await repository.getWords(itensFetched: words.length);
      words.addAll(paginatedWords);
      WWLogger.l(message: 'Fetched +${paginatedWords.length} words');
      WWLogger.l(message: 'Total of words: ${words.length}');
      emit(HistoryState.content(words: words));
    } catch (exception, stackTrace) {
      WWLogger.e(message: exception.toString(), exception: exception, stackTrace: stackTrace);
      emit(const HistoryState.error());
    }
  }
}
