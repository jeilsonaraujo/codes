import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorites_state.freezed.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.loading() = _Loading;

  const factory FavoritesState.error() = _Error;

  const factory FavoritesState.empty() = _Empty;

  const factory FavoritesState.paginating({required List<String> words}) = _Paginating;

  const factory FavoritesState.content({required List<String> words}) = _Content;
}

extension FavoritesStateExt on FavoritesState {
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
