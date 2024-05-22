import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:word_wise/core/logger.dart';
import 'package:word_wise/dto/word_detail_dto.dart';

class CacheService {
  static String get cacheBoxName => 'dictionaryApiCache';
  static String get _cacheBoxNameDate => 'dictionaryApiCacheDate';
  static int get timeToLiveInHours => 2;
  Box hiveBox;

  CacheService({required this.hiveBox});

  Future<WordDetailDto?> getFromCache({required String path}) async {
    final data = hiveBox.get(path);
    if (data != null) WWLogger.i(message: 'Word: "$path" was found on cache');

    return data == null ? null : WordDetailDto.fromJson(jsonDecode(data));
  }

  Future<void> putOnCache({required String path, required WordDetailDto wordDetail}) async {
    WWLogger.i(message: 'Word: "${wordDetail.word}" stored on cache');

    hiveBox.put(path, jsonEncode(wordDetail));
  }

  static bool _isCacheValid(Box<dynamic> hiveBox) {
    final cacheDate = hiveBox.get(_cacheBoxNameDate);
    if (cacheDate == null) {
      WWLogger.i(message: 'Creating cache data');

      hiveBox.put(_cacheBoxNameDate, DateTime.now().toIso8601String());
      return true;
    } else {
      final dateTimeNow = DateTime.now();
      final dateTimeCache = DateTime.parse(cacheDate);
      final difference = dateTimeNow.difference(dateTimeCache);
      WWLogger.i(message: 'Cache lifetime $difference');

      return difference.inHours < timeToLiveInHours;
    }
  }

  static Future<void> _invalidateCache(Box<dynamic> hiveBox) async {
    WWLogger.w(message: 'Clear cache');
    await hiveBox.deleteFromDisk();
  }

  static Future<Box<dynamic>> setupHive() async {
    WWLogger.i(message: 'Check cache status');

    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    Box<dynamic> box = await Hive.openBox(CacheService.cacheBoxName);

    if (_isCacheValid(box)) return box;
    await _invalidateCache(box);
    return await Hive.openBox(CacheService.cacheBoxName);
  }
}
