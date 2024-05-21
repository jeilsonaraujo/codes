import 'package:json_annotation/json_annotation.dart';
import 'package:word_wise/dto/word_detail_meaning_dto.dart';
import 'package:word_wise/dto/word_detail_phonetic_dto.dart';

part 'word_detail_dto.g.dart';

@JsonSerializable()
class WordDetailDto {
  final String? word;
  final List<WordPhoneticDetailDto>? phonetics;
  final List<WordDetailMeaningDto>? meanings;

  WordDetailDto({
    this.word,
    this.phonetics,
    this.meanings,
  });

  factory WordDetailDto.fromJson(Map<String, dynamic> json) => _$WordDetailDtoFromJson(json);
  factory WordDetailDto.fixture() => WordDetailDto(word: 'hello', phonetics: [WordPhoneticDetailDto.fixture()]);

  Map<String, dynamic> toJson() => _$WordDetailDtoToJson(this);
}
