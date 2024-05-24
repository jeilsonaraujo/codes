import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_history_dto.freezed.dart';
part 'word_history_dto.g.dart';

@freezed
class WordHistoryDto with _$WordHistoryDto {
  const factory WordHistoryDto({
    @Default('') @JsonKey(name: 'word_name') String wordName,
    @Default('') @JsonKey(name: 'created_at') String createdAt,
  }) = _WordHistoryDto;

  factory WordHistoryDto.fromJson(Map<String, dynamic> json) => _$WordHistoryDtoFromJson(json);

  factory WordHistoryDto.fixture() => WordHistoryDto(wordName: 'hello', createdAt: DateTime(2022).toIso8601String());
}
