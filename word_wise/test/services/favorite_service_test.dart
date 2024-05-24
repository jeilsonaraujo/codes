import 'package:word_wise/services/favorite_service.dart';
import 'package:word_wise/wrappers/supabase_wrapper.dart';

import '../mocks/mocks.dart';

void main() {
  final mock = SupabaseWrapperMock();

  tearDown(() => mock.resetMock());

  test('''when [FavoriteService] calls addFavorite should check first if this word is not favorite''', () async {
    final sut = FavoriteService(supabaseWrapper: mock);
    mock.whenGetReturnValue(answer: null);
    mock.whenInsertReturnValue();

    await sut.addFavorite(word: 'word', userId: 'my_fake_user');

    mock.verifyGet(
      table: SupabaseWrapper.favoritesTableName,
      columns: FavoritesTableColumns.all.name,
      columnEQA: FavoritesTableColumns.userId.name,
      valueEQA: 'my_fake_user',
      columnEQB: FavoritesTableColumns.wordName.name,
      valueEQB: 'word',
      calledTimes: 1,
    );
    mock.verifyInsert(
      table: SupabaseWrapper.favoritesTableName,
      values: {FavoritesTableColumns.wordName.name: 'word', FavoritesTableColumns.userId.name: 'my_fake_user'},
      calledTimes: 1,
    );
  });

  test('''when [FavoriteService] calls addFavorite should and this word is not favorite should add to favorite''', () async {
    final sut = FavoriteService(supabaseWrapper: mock);
    mock.whenGetReturnValue(answer: null);
    mock.whenInsertReturnValue();

    await sut.addFavorite(word: 'word', userId: 'my_fake_user');

    mock.verifyGet(
      table: SupabaseWrapper.favoritesTableName,
      columns: FavoritesTableColumns.all.name,
      columnEQA: FavoritesTableColumns.userId.name,
      valueEQA: 'my_fake_user',
      columnEQB: FavoritesTableColumns.wordName.name,
      valueEQB: 'word',
      calledTimes: 1,
    );
    mock.verifyInsert(calledTimes: 1);
  });

  test('when [FavoriteService] calls addFavorite and this word already is a favorite should not call to add to favorite list', () async {
    final sut = FavoriteService(supabaseWrapper: mock);
    mock.whenGetReturnValue(answer: [
      {FavoritesTableColumns.wordName.name: 'word', FavoritesTableColumns.userId.name: 'my_fake_user'}
    ]);
    mock.whenInsertReturnValue();

    await sut.addFavorite(word: 'word', userId: 'my_fake_user');

    mock.verifyGet(
      table: SupabaseWrapper.favoritesTableName,
      columns: FavoritesTableColumns.all.name,
      columnEQA: FavoritesTableColumns.userId.name,
      valueEQA: 'my_fake_user',
      columnEQB: FavoritesTableColumns.wordName.name,
      valueEQB: 'word',
      calledTimes: 1,
    );
    mock.verifyInsert(calledTimes: 0);
  });

  test('when [FavoriteService] calls getFavorites should return a list of favorites for a specific user', () async {
    final sut = FavoriteService(supabaseWrapper: mock);
    mock.whenGetReturnValue(answer: [
      {FavoritesTableColumns.wordName.name: 'word', FavoritesTableColumns.userId.name: 'my_fake_user'},
      {FavoritesTableColumns.wordName.name: 'list', FavoritesTableColumns.userId.name: 'my_fake_user'},
    ]);
    mock.whenInsertReturnValue();

    final result = await sut.getFavorites(userId: 'my_fake_user');

    expect(result, ['word', 'list']);
    mock.verifyGet(
      table: SupabaseWrapper.favoritesTableName,
      columns: FavoritesTableColumns.all.name,
      columnEQA: FavoritesTableColumns.userId.name,
      valueEQA: 'my_fake_user',
      calledTimes: 1,
    );
  });

  test('favorite service remove ...', () async {
    final sut = FavoriteService(supabaseWrapper: mock);
    const wordId = 3;
    mock.whenGetReturnValue(answer: [
      {
        FavoritesTableColumns.id.name: wordId,
        FavoritesTableColumns.wordName.name: 'word',
        FavoritesTableColumns.userId.name: 'my_fake_user',
      }
    ]);
    mock.whenRemoveReturnValue(table: SupabaseWrapper.favoritesTableName, match: {FavoritesTableColumns.id.name: wordId});

    sut.removeFavorite(word: 'word', userId: 'my_fake_user');
  }, skip: true);
}
