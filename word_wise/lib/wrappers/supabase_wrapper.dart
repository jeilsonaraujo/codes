import 'package:supabase_flutter/supabase_flutter.dart';

enum FavoritesTableColumns { id, userId, wordName, all }

extension FavoritesTableColumnsExt on FavoritesTableColumns {
  String get name => [
        'id',
        'user_id',
        'word_name',
        '*',
      ][index];
}

enum HistoryTableColumns { id, createdAt, userId, wordName, all }

extension HistoryTableColumnsExt on HistoryTableColumns {
  String get name => [
        'id',
        'created_at',
        'user_id',
        'word_name',
        '*',
      ][index];
}

enum WordsTableColumns { id, wordName, language, all }

extension WordsTableColumnsExt on WordsTableColumns {
  String get name => [
        'id',
        'word_name',
        'language',
        '*',
      ][index];
}

class SupabaseWrapper {
  final SupabaseClient supabaseClient;

  static String get favoritesTableName => 'favorites';
  static String get historyTableName => 'history';
  static String get wordsTableName => 'words';

  SupabaseWrapper({required this.supabaseClient});

  Future<void> insert({required String table, required Map<String, dynamic> values}) async {
    await supabaseClient.from(table).insert(values);
  }

  Future<void> remove({required String table, required Map<String, Object> match}) async {
    await supabaseClient.from(table).delete().match(match);
  }

  Future<List<Map<String, dynamic>>> get({
    required String table,
    required String columns,
    String? columnEQA,
    String? valueEQA,
    String? columnEQB,
    String? valueEQB,
  }) async {
    final filterEQA = columnEQA != null && valueEQA != null;
    final filterEQB = columnEQB != null && valueEQB != null;
    if (filterEQA) return await supabaseClient.from(table).select(columns).eq(columnEQA, valueEQA);
    if (filterEQA && filterEQB) return await supabaseClient.from(table).select(columns).eq(columnEQA, valueEQA).eq(columnEQB, valueEQB);
    return await supabaseClient.from(table).select(columns);
  }

  Future<List<Map<String, dynamic>>> getPaginated({
    required String table,
    required String columns,
    required int paginationStart,
    required int paginationEnd,
  }) async {
    return await supabaseClient.from(table).select(columns).range(paginationStart, paginationEnd);
  }
}
