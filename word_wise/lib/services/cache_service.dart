import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:word_wise/dto/word_detail_dto.dart';

class CacheService {
  static get cacheBoxName => 'dictionaryApiCache';
  static get _cacheBoxNameDate => 'dictionaryApiCacheDate';
  Box hiveBox;

  CacheService({required this.hiveBox});

  Future<WordDetailDto?> getWordDetailCache({required String path}) async {
    final data = hiveBox.get(path);

    return data == null ? null : WordDetailDto.fromJson(jsonDecode(data));
  }

  Future<void> setWordDetailCache({required String path, required WordDetailDto wordDetail}) async {
    hiveBox.put(path, jsonEncode(wordDetail));
  }

  static bool _isCacheValid(Box<dynamic> hiveBox) {
    final cacheDate = hiveBox.get(_cacheBoxNameDate);
    if (cacheDate == null) {
      hiveBox.put(_cacheBoxNameDate, DateTime.now().toIso8601String());
      return true;
    } else {
      final dateTimeNow = DateTime.now();
      final dateTimeCache = DateTime.parse(cacheDate);
      final difference = dateTimeNow.difference(dateTimeCache);

      return difference.inMinutes < 5;
    }
  }

  static Future<void> _invalidateCache(Box<dynamic> hiveBox) async {
    await hiveBox.deleteFromDisk();
  }

  static Future<Box<dynamic>> setupHive() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    Box<dynamic> box = await Hive.openBox(CacheService.cacheBoxName);

    if (_isCacheValid(box)) return box;
    await _invalidateCache(box);
    return await Hive.openBox(CacheService.cacheBoxName);
  }
}
