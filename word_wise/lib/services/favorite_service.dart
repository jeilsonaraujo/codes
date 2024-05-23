import 'package:word_wise/core/wrappers/supabase_wrapper.dart';

class FavoriteService {
  final SupabaseWrapper supabaseWrapper;

  FavoriteService({required this.supabaseWrapper});

  Future<void> addFavorite({required String word, required String userId}) async {
    final data = await supabaseWrapper.get(
      table: SupabaseWrapper.favoritesTableName,
      columns: FavoritesTableColumns.all.name,
      columnEQA: FavoritesTableColumns.userId.name,
      valueEQA: userId,
      columnEQB: FavoritesTableColumns.wordName.name,
      valueEQB: word,
    );
    if (data.isEmpty) {
      await supabaseWrapper
          .insert(table: SupabaseWrapper.favoritesTableName, values: {FavoritesTableColumns.wordName.name: word, FavoritesTableColumns.userId.name: userId});
    }
  }

  Future<void> removeFavorite({required String word, required String userId}) async {
    final data = await supabaseWrapper.get(
      table: SupabaseWrapper.favoritesTableName,
      columns: FavoritesTableColumns.id.name,
      columnEQA: FavoritesTableColumns.userId.name,
      valueEQA: userId,
      columnEQB: FavoritesTableColumns.userId.name,
      valueEQB: word,
    );
    if (data.isNotEmpty) {
      final id = data.first[FavoritesTableColumns.id.name];
      await supabaseWrapper.remove(table: SupabaseWrapper.favoritesTableName, match: {FavoritesTableColumns.id.name: id});
    }
  }

  Future<List<String>> getFavorites({required String userId}) async {
    final data = await supabaseWrapper.get(
      table: SupabaseWrapper.favoritesTableName,
      columns: FavoritesTableColumns.userId.name,
      columnEQA: FavoritesTableColumns.userId.name,
      valueEQA: userId,
    );
    final result = data.map((e) => e[FavoritesTableColumns.wordName.name] as String? ?? '').toList();

    return result;
  }
}
