import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_wise/dto/word_detail_definitions_dto.dart';

part 'word_detail_meaning_dto.freezed.dart';
part 'word_detail_meaning_dto.g.dart';

@freezed
class WordDetailMeaningDto with _$WordDetailMeaningDto {
  const factory WordDetailMeaningDto({
    @Default('') String partOfSpeech,
    @Default([]) List<WordDetailDefinitionsDto> definitions,
  }) = _WordDetailMeaningDto;

  factory WordDetailMeaningDto.fromJson(Map<String, dynamic> json) => _$WordDetailMeaningDtoFromJson(json);

  factory WordDetailMeaningDto.fixture() => WordDetailMeaningDto(partOfSpeech: 'noun', definitions: [WordDetailDefinitionsDto.fixture()]);
}
