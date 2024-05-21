import 'package:json_annotation/json_annotation.dart';

part 'word_detail_phonetic_dto.g.dart';

@JsonSerializable()
class WordPhoneticDetailDto {
  final String? text;

  WordPhoneticDetailDto({
    this.text,
  });

  factory WordPhoneticDetailDto.fromJson(Map<String, dynamic> json) => _$WordPhoneticDetailDtoFromJson(json);
  factory WordPhoneticDetailDto.fixture() => WordPhoneticDetailDto(text: '/həˈloʊ/');

  Map<String, dynamic> toJson() => _$WordPhoneticDetailDtoToJson(this);
}
