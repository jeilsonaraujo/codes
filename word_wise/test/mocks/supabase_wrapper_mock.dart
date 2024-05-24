import 'package:mocktail/mocktail.dart';
import 'package:word_wise/wrappers/supabase_wrapper.dart';

class SupabaseWrapperMock extends Mock implements SupabaseWrapper {
  resetMock() => reset(this);
  //* when *//
  whenGetReturnValue({String? table, String? columns, String? columnEQA, String? valueEQA, String? columnEQB, String? valueEQB, required dynamic answer}) {
    when(() => get(
          table: table ?? any(named: 'table'),
          columns: columns ?? any(named: 'columns'),
          columnEQA: columnEQA ?? any(named: 'columnEQA'),
          valueEQA: valueEQA ?? any(named: 'valueEQA'),
          columnEQB: columnEQB ?? any(named: 'columnEQB'),
          valueEQB: valueEQB ?? any(named: 'valueEQB'),
        )).thenAnswer((_) => Future.value(answer ?? []));
  }

  whenGetPaginatedReturnValue({String? table, String? columns, int? paginationStart, int? paginationEnd, dynamic answer}) {
    when(() => getPaginated(
          table: table ?? any(named: 'table'),
          columns: columns ?? any(named: 'columns'),
          paginationStart: paginationStart ?? any(named: 'paginationStart'),
          paginationEnd: paginationEnd ?? any(named: 'paginationEnd'),
        )).thenAnswer((_) => Future.value(answer ?? []));
  }

  whenInsertReturnValue({String? table, Map<String, dynamic>? values}) {
    when(() => insert(table: table ?? any(named: 'table'), values: values ?? any(named: 'values'))).thenAnswer((_) => Future<void>.value());
  }

  whenRemoveReturnValue({String? table, Map<String, Object>? match}) {
    when(() => remove(table: table ?? any(named: 'table'), match: match ?? any(named: 'match'))).thenAnswer((_) => Future<void>.value());
  }

//* verify *//

  verifyGet({
    String? table,
    String? columns,
    String? columnEQA,
    String? valueEQA,
    String? columnEQB,
    String? valueEQB,
    required int calledTimes,
  }) {
    calledTimes == 0
        ? verifyNever(() => get(
            table: table ?? any(named: 'table'),
            columns: columns ?? any(named: 'columns'),
            columnEQA: columnEQA ?? any(named: 'columnEQA'),
            valueEQA: valueEQA ?? any(named: 'valueEQA'),
            columnEQB: columnEQB ?? any(named: 'columnEQB'),
            valueEQB: valueEQB ?? any(named: 'valueEQB')))
        : verify(() => get(
            table: table ?? any(named: 'table'),
            columns: columns ?? any(named: 'columns'),
            columnEQA: columnEQA ?? any(named: 'columnEQA'),
            valueEQA: valueEQA ?? any(named: 'valueEQA'),
            columnEQB: columnEQB ?? any(named: 'columnEQB'),
            valueEQB: valueEQB ?? any(named: 'valueEQB'))).called(calledTimes);
  }

  verifyGetPaginated({String? table, String? columns, int? paginationStart, int? paginationEnd, required int calledTimes}) {
    calledTimes == 0
        ? verifyNever(() => getPaginated(
            table: table ?? any(named: 'table'),
            columns: columns ?? any(named: 'columns'),
            paginationStart: paginationStart ?? any(named: 'paginationStart'),
            paginationEnd: paginationEnd ?? any(named: 'paginationEnd')))
        : verify(() => getPaginated(
            table: table ?? any(named: 'table'),
            columns: columns ?? any(named: 'columns'),
            paginationStart: paginationStart ?? any(named: 'paginationStart'),
            paginationEnd: paginationEnd ?? any(named: 'paginationEnd'))).called(calledTimes);
  }

  verifyInsert({String? table, Map<String, dynamic>? values, required int calledTimes}) {
    calledTimes == 0
        ? verifyNever(() => insert(table: table ?? any(named: 'table'), values: values ?? any(named: 'values')))
        : verify(() => insert(table: table ?? any(named: 'table'), values: values ?? any(named: 'values'))).called(calledTimes);
  }

  verifyRemove({String? table, Map<String, Object>? match, required int calledTimes}) {
    calledTimes == 0
        ? verifyNever(() => remove(table: table ?? any(named: 'table'), match: match ?? any(named: 'match')))
        : verify(() => remove(table: table ?? any(named: 'table'), match: match ?? any(named: 'match'))).called(calledTimes);
  }
}
