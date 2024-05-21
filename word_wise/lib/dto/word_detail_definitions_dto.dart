import 'package:json_annotation/json_annotation.dart';

part 'word_detail_definitions_dto.g.dart';

@JsonSerializable()
class WordDetailDefinitionsDto {
  final String? definition;
  final List<String>? synonyms;
  final List<String>? antonyms;
  final String? example;

  WordDetailDefinitionsDto({
    this.definition,
    this.synonyms,
    this.antonyms,
    this.example,
  });

  factory WordDetailDefinitionsDto.fromJson(Map<String, dynamic> json) => _$WordDetailDefinitionsDtoFromJson(json);
  factory WordDetailDefinitionsDto.fixture() => WordDetailDefinitionsDto(definition: 'hello', synonyms: ["greetings"]);

  Map<String, dynamic> toJson() => _$WordDetailDefinitionsDtoToJson(this);
}
