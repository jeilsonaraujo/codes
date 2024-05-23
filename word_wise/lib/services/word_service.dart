import 'package:word_wise/core/wrappers/supabase_wrapper.dart';

class WordService {
  final SupabaseWrapper supabaseWrapper;

  WordService({required this.supabaseWrapper});

  Future<List<String>> getWords({required int itensFetched, int pageSize = 20}) async {
    final paginationStart = itensFetched == 0 ? 0 : itensFetched + 1;
    final paginationEnd = itensFetched + pageSize;

    final data = await supabaseWrapper.getPaginated(
      table: 'words',
      columns: 'word_name',
      paginationStart: paginationStart,
      paginationEnd: paginationEnd,
    );

    final result = data.map((e) => e['word_name'] as String? ?? '').toList();

    return result;
  }
}
