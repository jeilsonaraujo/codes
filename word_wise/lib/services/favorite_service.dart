import 'package:word_wise/core/wrappers/supabase_wrapper.dart';

class FavoriteService {
  final SupabaseWrapper supabaseWrapper;

  FavoriteService({required this.supabaseWrapper});

  Future<void> addFavorite({required String word, required String userId}) async {
    final data = await supabaseWrapper.get(
      table: 'favorites',
      columns: '*',
      columnEQA: 'user_id',
      valueEQA: userId,
      columnEQB: 'word',
      valueEQB: word,
    );
    if (data.isEmpty) {
      await supabaseWrapper.insert(table: 'favorites', values: {'word': word, 'user_id': userId});
    }
  }

  Future<void> removeFavorite({required String word, required String userId}) async {
    final data = await supabaseWrapper.get(
      table: 'favorites',
      columns: 'id',
      columnEQA: 'user_id',
      valueEQA: userId,
      columnEQB: 'word',
      valueEQB: word,
    );
    if (data.isNotEmpty) {
      final id = data.first['id'];
      await supabaseWrapper.remove(table: 'favorites', match: {'id': id});
    }
  }

  Future<List<String>> getFavorites({required String userId}) async {
    final data = await supabaseWrapper.get(table: 'favorites', columns: 'word', columnEQA: 'user_id', valueEQA: userId);
    final result = data.map((e) => e['word'] as String? ?? '').toList();

    return result;
  }
}
