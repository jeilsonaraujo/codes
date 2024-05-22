import 'package:hive/hive.dart';

class FavoriteService {
  static get favoritesBoxName => 'favoritesWords';
  Box hiveBox;

  FavoriteService({required this.hiveBox});

  Future<void> setFavorite({required String word, required bool isFavorite}) async {}

  Future<void> getFavorites({required String word, required bool isFavorite}) async {}
}
