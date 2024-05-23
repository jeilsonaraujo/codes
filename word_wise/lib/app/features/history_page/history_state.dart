import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_state.freezed.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState.loading() = _Loading;

  const factory HistoryState.error() = _Error;

  const factory HistoryState.empty() = _Empty;

  const factory HistoryState.paginating({required List<String> words}) = _Paginating;

  const factory HistoryState.content({required List<String> words}) = _Content;
}

extension HistoryStateExt on HistoryState {
  bool get isContentOrPaginating => this is _Loading || this is _Paginating;
  bool get isLoading => this is _Loading;
  bool get isPaginating => this is _Paginating;
  bool get isContent => this is _Content;
  bool get isError => this is _Error;
  bool get isEmpty => this is _Empty;

  List get getWords => this is _Content
      ? (this as _Content).words
      : this is _Paginating
          ? (this as _Paginating).words
          : [];
}
