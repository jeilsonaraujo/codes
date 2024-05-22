import 'package:supabase_flutter/supabase_flutter.dart';

class HistoryService {
  final SupabaseClient supabaseClient;

  HistoryService({required this.supabaseClient});

  Future<List<String>> getHistory({required String userId}) async {
    final data = await supabaseClient.from('historic').select('*');
    final result = data.map((e) => e['word'] as String? ?? '').toList();

    return result;
  }

  Future<void> registerVisit({required String word, required String userId}) async {
    await supabaseClient.from('historic').insert({'word': word, 'user_id': userId});
  }

  Future<void> clearHistory({required String userId}) async {
    await supabaseClient.from('historic').delete().match({'user_id': userId});
  }
}
