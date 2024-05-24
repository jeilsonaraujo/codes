import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_detail_phonetic_dto.freezed.dart';
part 'word_detail_phonetic_dto.g.dart';

@freezed
class WordPhoneticDetailDto with _$WordPhoneticDetailDto {
  const factory WordPhoneticDetailDto({@Default('') String text}) = _WordPhoneticDetailDto;

  factory WordPhoneticDetailDto.fromJson(Map<String, dynamic> json) => _$WordPhoneticDetailDtoFromJson(json);

  factory WordPhoneticDetailDto.fixture() => const WordPhoneticDetailDto(text: '/həˈloʊ/');
}
