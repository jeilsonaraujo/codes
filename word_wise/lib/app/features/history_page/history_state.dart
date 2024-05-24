import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_wise/dto/word_history_dto.dart';

part 'history_state.freezed.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState.loading() = _Loading;

  const factory HistoryState.error() = _Error;

  const factory HistoryState.empty() = _Empty;

  const factory HistoryState.content({required List<WordHistoryDto> words}) = _Content;
}

extension HistoryStateExt on HistoryState {
  bool get isLoading => this is _Loading;
  bool get isContent => this is _Content;
  bool get isError => this is _Error;
  bool get isEmpty => this is _Empty;

  List<WordHistoryDto> get getWords => this is _Content ? (this as _Content).words : [];
}
