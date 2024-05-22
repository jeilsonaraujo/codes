import 'package:supabase_flutter/supabase_flutter.dart';

class FavoriteService {
  final SupabaseClient supabaseClient;

  FavoriteService({required this.supabaseClient});

  Future<void> addFavorite({required String word, required String userId}) async {
    final data = await supabaseClient.from('favorites').select('*').eq('user_id', userId).eq('word', word);
    if (data.isEmpty) {
      await supabaseClient.from('favorites').insert({'word': word, 'user_id': userId});
    }
  }

  Future<void> removeFavorite({required String word, required String userId}) async {
    final data = await supabaseClient.from('favorites').select('id').eq('user_id', userId).eq('word', word);
    if (data.isNotEmpty) {
      final id = data.first['id'];
      await supabaseClient.from('favorites').delete().match({'id': id});
    }
  }

  Future<List<String>> getFavorites({required String userId}) async {
    final data = await supabaseClient.from('favorites').select('word').eq('user_id', userId);
    final result = data.map((e) => e['word'] as String? ?? '').toList();

    return result;
  }
}
