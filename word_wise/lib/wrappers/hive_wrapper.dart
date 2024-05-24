import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:word_wise/core/logger.dart';

class HiveWrapper {
  final Box box;

  HiveWrapper({required this.box});

  static Future<Box<dynamic>> openBox({required String boxName, int? timeToLiveCacheInHours}) async {
    WWLogger.i(message: 'Check cache status');

    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    Box<dynamic> box = await Hive.openBox(boxName);

    if (timeToLiveCacheInHours == null || _isCacheValid(box, boxName: boxName, timeToLiveCacheInHours: timeToLiveCacheInHours)) return box;
    await _invalidateCache(box);
    return await Hive.openBox(boxName);
  }

  static Future<void> _invalidateCache(Box<dynamic> hiveBox) async {
    WWLogger.w(message: 'Clear cache');
    await hiveBox.deleteFromDisk();
  }

  static bool _isCacheValid(Box<dynamic> hiveBox, {required String boxName, required int timeToLiveCacheInHours}) {
    final cacheDate = hiveBox.get('${boxName}TTL');
    if (cacheDate == null) {
      WWLogger.i(message: 'Creating cache data');

      hiveBox.put('${boxName}TTL', DateTime.now().toIso8601String());
      return true;
    } else {
      final dateTimeNow = DateTime.now();
      final dateTimeCache = DateTime.parse(cacheDate);
      final difference = dateTimeNow.difference(dateTimeCache);
      WWLogger.i(message: 'Cache lifetime $difference');

      return difference.inHours < timeToLiveCacheInHours;
    }
  }

  dynamic get(String key) async {
    return await box.get(key);
  }

  dynamic put(String key, dynamic value) async {
    return await box.put(key, value);
  }
}
