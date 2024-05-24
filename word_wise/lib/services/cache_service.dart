import 'dart:convert';

import 'package:word_wise/dto/word_detail_dto.dart';
import 'package:word_wise/wrappers/hive_wrapper.dart';

class CacheService {
  final HiveWrapper hiveWrapper;

  CacheService({required this.hiveWrapper});

  Future<WordDetailDto?> getFromCache({required String key}) async {
    final data = await hiveWrapper.get(key);
    return data == null ? null : WordDetailDto.fromJson(jsonDecode(data));
  }

  Future<void> putOnCache({required String key, required dynamic value}) async {
    await hiveWrapper.put(key, jsonEncode(value));
  }
}
