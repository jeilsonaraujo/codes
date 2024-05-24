import 'package:word_wise/dto/word_history_dto.dart';
import 'package:word_wise/wrappers/supabase_wrapper.dart';

class HistoryService {
  final SupabaseWrapper supabaseWrapper;

  HistoryService({required this.supabaseWrapper});

  Future<List<WordHistoryDto>> getHistory({required String userId}) async {
    final data = await supabaseWrapper.get(
      table: SupabaseWrapper.historyTableName,
      columns: HistoryTableColumns.all.name,
      columnEQA: HistoryTableColumns.userId.name,
      valueEQA: userId,
    );
    final result = data.map((word) => WordHistoryDto.fromJson(word)).toList();

    return result;
  }

  Future<void> registerVisit({required String word, required String userId}) async {
    await supabaseWrapper.insert(
      table: SupabaseWrapper.historyTableName,
      values: {HistoryTableColumns.wordName.name: word, HistoryTableColumns.userId.name: userId},
    );
  }

  Future<void> clearHistory({required String userId}) async {
    await supabaseWrapper.remove(
      table: SupabaseWrapper.historyTableName,
      match: {HistoryTableColumns.userId.name: userId},
    );
  }
}
