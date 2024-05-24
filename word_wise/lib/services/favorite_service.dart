import 'package:word_wise/core/logger.dart';
import 'package:word_wise/wrappers/supabase_wrapper.dart';

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
      await supabaseWrapper.insert(table: SupabaseWrapper.favoritesTableName, values: {
        FavoritesTableColumns.wordName.name: word,
        FavoritesTableColumns.userId.name: userId,
      });
    } else {
      final favorites = data.where((favorite) => favorite[FavoritesTableColumns.wordName.name] == word).toList();
      if (favorites.isEmpty) {
        await supabaseWrapper.insert(table: SupabaseWrapper.favoritesTableName, values: {
          FavoritesTableColumns.wordName.name: word,
          FavoritesTableColumns.userId.name: userId,
        });
      }
    }
  }

  Future<void> removeFavorite({required String word, required String userId}) async {
    final data = await supabaseWrapper.get(
      table: SupabaseWrapper.favoritesTableName,
      columns: FavoritesTableColumns.all.name,
      columnEQA: FavoritesTableColumns.userId.name,
      valueEQA: userId,
      columnEQB: FavoritesTableColumns.userId.name,
      valueEQB: word,
    );
    if (data.isNotEmpty) {
      await supabaseWrapper.remove(table: SupabaseWrapper.favoritesTableName, match: {
        FavoritesTableColumns.wordName.name: word,
        FavoritesTableColumns.userId.name: userId,
      });
    }
  }

  Future<List<String>> getFavorites({required String userId}) async {
    final data = await supabaseWrapper.get(
      table: SupabaseWrapper.favoritesTableName,
      columns: FavoritesTableColumns.all.name,
      columnEQA: FavoritesTableColumns.userId.name,
      valueEQA: userId,
    );
    final result = data.map((favorite) => favorite[FavoritesTableColumns.wordName.name] as String? ?? '').toList();

    return result;
  }

  Future<bool> isFavoriteWord({required String userId, required String word}) async {
    final data = await supabaseWrapper.get(
        table: SupabaseWrapper.favoritesTableName,
        columns: FavoritesTableColumns.all.name,
        columnEQA: FavoritesTableColumns.userId.name,
        valueEQA: userId,
        columnEQB: FavoritesTableColumns.wordName.name,
        valueEQB: word);
    final result = data.map((e) => e[FavoritesTableColumns.wordName.name] as String? ?? '').toList();

    WWLogger.i(message: 'Word: $word ${result.contains(word) ? 'is Favorite' : 'is not Favorite'}');
    return result.contains(word);
  }
}
