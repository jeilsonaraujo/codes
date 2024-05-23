import 'package:freezed_annotation/freezed_annotation.dart';

part 'words_state.freezed.dart';

@freezed
class WordsState with _$WordsState {
  const factory WordsState.loading() = Loading;

  const factory WordsState.error() = Error;

  const factory WordsState.empty() = Empty;

  const factory WordsState.paginating({required List<String> words}) = Paginating;

  const factory WordsState.content({required List<String> words}) = Content;
}
