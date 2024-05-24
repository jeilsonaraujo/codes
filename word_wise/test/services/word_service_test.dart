import 'package:word_wise/services/word_service.dart';
import 'package:word_wise/wrappers/supabase_wrapper.dart';

import '../mocks/mocks.dart';

void main() {
  final mock = SupabaseWrapperMock();

  tearDown(() => mock.resetMock());

  test('when [WordService] try getPaginated and get empty data should return a empty list', () async {
    final sut = WordService(supabaseWrapper: mock);
    mock.whenGetPaginatedReturnValue();

    final result = await sut.getWords(itensFetched: 0);

    expect(result, []);
    mock.verifyGetPaginated(
      table: SupabaseWrapper.wordsTableName,
      columns: WordsTableColumns.wordName.name,
      paginationStart: 0,
      paginationEnd: WordService.paginationSize,
      calledTimes: 1,
    );
  });

  test('when [WordService] try getPaginated and get the data should return a list of words', () async {
    final sut = WordService(supabaseWrapper: mock);
    mock.whenGetPaginatedReturnValue(answer: [
      {WordsTableColumns.wordName.name: "hello"},
      {WordsTableColumns.wordName.name: "help"},
      {WordsTableColumns.wordName.name: "confirm"},
    ]);

    final result = await sut.getWords(itensFetched: 0);

    expect(result, ['hello', 'help', 'confirm']);
    mock.verifyGetPaginated(
      table: SupabaseWrapper.wordsTableName,
      columns: WordsTableColumns.wordName.name,
      paginationStart: 0,
      paginationEnd: WordService.paginationSize,
      calledTimes: 1,
    );
  });
}
