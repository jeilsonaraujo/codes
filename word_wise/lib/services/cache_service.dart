import 'dart:convert';

import 'package:word_wise/core/logger.dart';
import 'package:word_wise/dto/word_detail_dto.dart';
import 'package:word_wise/wrappers/hive_wrapper.dart';

class CacheService {
  final HiveWrapper hiveWrapper;

  CacheService({required this.hiveWrapper});

  Future<WordDetailDto?> getFromCache({required String path}) async {
    final data = hiveWrapper.get(path);
    if (data != null) WWLogger.i(message: 'Word: "$path" was found on cache');

    return data == null ? null : WordDetailDto.fromJson(jsonDecode(data));
  }

  Future<void> putOnCache({required String path, required WordDetailDto wordDetail}) async {
    WWLogger.i(message: 'Word: "${wordDetail.word}" stored on cache');

    hiveWrapper.put(path, jsonEncode(wordDetail));
  }
}
