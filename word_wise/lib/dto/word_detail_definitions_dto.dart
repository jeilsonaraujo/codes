import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_detail_definitions_dto.freezed.dart';
part 'word_detail_definitions_dto.g.dart';

@freezed
class WordDetailDefinitionsDto with _$WordDetailDefinitionsDto {
  const factory WordDetailDefinitionsDto({
    @Default('') String definition,
    @Default([]) List<String> synonyms,
    @Default([]) List<String> antonyms,
    @Default('') String example,
  }) = _WordDetailDefinitionsDto;

  factory WordDetailDefinitionsDto.fromJson(Map<String, dynamic> json) => _$WordDetailDefinitionsDtoFromJson(json);
  factory WordDetailDefinitionsDto.fixture() => const WordDetailDefinitionsDto(definition: 'hello', synonyms: ["greetings"]);
}
