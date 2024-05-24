import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_wise/dto/word_detail_dto.dart';

part 'word_definition_state.freezed.dart';

@freezed
class WordDefinitionState with _$WordDefinitionState {
  const factory WordDefinitionState.loading() = _Loading;

  const factory WordDefinitionState.error() = _Error;

  const factory WordDefinitionState.content({required WordDetailDto wordDetail, required bool isFavorite}) = _Content;
}

extension WordDefinitionStateExt on WordDefinitionState {
  bool get isLoading => this is _Loading;
  bool get isContent => this is _Content;
  bool get isError => this is _Error;
}
