import 'package:supabase_flutter/supabase_flutter.dart';

class WordService {
  final SupabaseClient supabaseClient;

  WordService({required this.supabaseClient});

  Future<List<String>> getWords({required int itensFetched, int pageSize = 20}) async {
    final paginationStart = itensFetched == 0 ? 0 : itensFetched + 1;
    final paginationEnd = itensFetched + pageSize;
    final data = await supabaseClient.from('words').select('word_name').range(paginationStart, paginationEnd);
    final result = data.map((e) => e['word_name'] as String? ?? '').toList();

    return result;
  }
}
