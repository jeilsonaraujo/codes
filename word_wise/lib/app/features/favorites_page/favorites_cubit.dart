import 'package:bloc/bloc.dart';
import 'package:word_wise/app/features/favorites_page/favorites_state.dart';
import 'package:word_wise/core/logger.dart';
import 'package:word_wise/repositories/word_repository.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final WordRepository repository;
  FavoritesCubit({required this.repository}) : super(const FavoritesState.loading());
  List<String> words = [];

  Future<void> load() async {
    try {
      emit(const FavoritesState.loading());
      WWLogger.l(message: 'Loading words');
      words = await repository.getFavoriteWords(userId: 'b57e89bf-279b-4edb-904d-b6da662a37a2');
      WWLogger.l(message: 'Fetched ${words.length} favorites');
      words.isEmpty ? emit(const FavoritesState.empty()) : emit(FavoritesState.content(words: words));
    } catch (exception, stackTrace) {
      WWLogger.e(message: exception.toString(), exception: exception, stackTrace: stackTrace);
      emit(const FavoritesState.error());
    }
  }

  Future<void> paginate() async {
    try {
      emit(FavoritesState.paginating(words: words));
      WWLogger.l(message: 'Paginating words');
      final paginatedWords = await repository.getWords(itensFetched: words.length);
      words.addAll(paginatedWords);
      WWLogger.l(message: 'Fetched +${paginatedWords.length} words');
      WWLogger.l(message: 'Total of words: ${words.length}');
      emit(FavoritesState.content(words: words));
    } catch (exception, stackTrace) {
      WWLogger.e(message: exception.toString(), exception: exception, stackTrace: stackTrace);
      emit(const FavoritesState.error());
    }
  }
}
