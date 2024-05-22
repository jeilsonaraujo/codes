import 'package:hive/hive.dart';

class HistoryService {
  static get favoritesBoxName => 'favoritesWords';
  Box hiveBox;

  HistoryService({required this.hiveBox});

  Future<List<String>> getHistory() async {
    return [];
  }

  Future<void> registerVisit({required String word}) async {}
}
