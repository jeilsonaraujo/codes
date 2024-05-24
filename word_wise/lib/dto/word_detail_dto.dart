import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_wise/dto/word_detail_meaning_dto.dart';
import 'package:word_wise/dto/word_detail_phonetic_dto.dart';

part 'word_detail_dto.freezed.dart';
part 'word_detail_dto.g.dart';

@freezed
class WordDetailDto with _$WordDetailDto {
  const factory WordDetailDto({
    @Default('') String word,
    @Default([]) List<WordPhoneticDetailDto> phonetics,
    @Default([]) List<WordDetailMeaningDto> meanings,
  }) = _WordDetailDto;

  factory WordDetailDto.fromJson(Map<String, dynamic> json) => _$WordDetailDtoFromJson(json);

  factory WordDetailDto.fixture() => WordDetailDto(word: 'hello', phonetics: [WordPhoneticDetailDto.fixture()]);
}
