import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseWrapper {
  final SupabaseClient supabaseClient;

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
