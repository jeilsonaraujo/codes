import 'package:word_wise/core/wrappers/supabase_wrapper.dart';

class WordService {
  final SupabaseWrapper supabaseWrapper;
  static int paginationSize = 100;

  WordService({required this.supabaseWrapper});

  Future<List<String>> getWords({required int itensFetched}) async {
    final paginationStart = itensFetched == 0 ? 0 : itensFetched + 1;
    final paginationEnd = itensFetched + paginationSize;

    final data = await supabaseWrapper.getPaginated(
      table: SupabaseWrapper.wordsTableName,
      columns: WordsTableColumns.wordName.name,
      paginationStart: paginationStart,
      paginationEnd: paginationEnd,
    );

    final result = data.map((e) => e[WordsTableColumns.wordName.name] as String? ?? '').toList();

    return result;
  }
}
