import 'package:bloc/bloc.dart';
import 'package:word_wise/app/features/history_page/history_state.dart';
import 'package:word_wise/core/logger.dart';
import 'package:word_wise/dto/word_history_dto.dart';
import 'package:word_wise/repositories/word_repository.dart';
import 'package:word_wise/services/auth_service.dart';
import 'package:word_wise/wrappers/supabase_wrapper.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final AuthService authService;
  final WordRepository repository;
  HistoryCubit({required this.authService, required this.repository}) : super(const HistoryState.loading());
  List<WordHistoryDto> words = [];

  Future<void> load() async {
    try {
      words.clear();
      emit(const HistoryState.loading());
      WWLogger.l(message: 'Loading history');
      words = await repository.getHistory(userId: authService.applicationUser?.userId ?? '', sortId: HistoryTableColumns.id.name, ascending: false);
      WWLogger.l(message: 'Fetched ${words.length} history');
      words.isEmpty ? emit(const HistoryState.empty()) : emit(HistoryState.content(words: words));
    } catch (exception, stackTrace) {
      WWLogger.e(message: exception.toString(), exception: exception, stackTrace: stackTrace);
      emit(const HistoryState.error());
    }
  }
}
