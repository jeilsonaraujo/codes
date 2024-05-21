import 'package:json_annotation/json_annotation.dart';
import 'package:word_wise/dto/word_detail_definitions_dto.dart';

part 'word_detail_meaning_dto.g.dart';

@JsonSerializable()
class WordDetailMeaningDto {
  final String? partOfSpeech;
  final List<WordDetailDefinitionsDto>? definitions;

  WordDetailMeaningDto({
    this.partOfSpeech,
    this.definitions,
  });

  factory WordDetailMeaningDto.fromJson(Map<String, dynamic> json) => _$WordDetailMeaningDtoFromJson(json);
  factory WordDetailMeaningDto.fixture() => WordDetailMeaningDto(partOfSpeech: 'noun', definitions: [WordDetailDefinitionsDto.fixture()]);

  Map<String, dynamic> toJson() => _$WordDetailMeaningDtoToJson(this);
}
