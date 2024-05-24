import 'package:bloc/bloc.dart';
import 'package:word_wise/app/features/favorites_page/favorites_state.dart';
import 'package:word_wise/core/logger.dart';
import 'package:word_wise/repositories/word_repository.dart';
import 'package:word_wise/services/auth_service.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final AuthService authService;
  final WordRepository repository;
  FavoritesCubit({required this.repository, required this.authService}) : super(const FavoritesState.loading());

  List<String> words = [];

  Future<void> load() async {
    try {
      emit(const FavoritesState.loading());
      WWLogger.l(message: 'Loading words');
      words = await repository.getFavoriteWords(userId: authService.applicationUser?.userId ?? '');
      WWLogger.l(message: 'Fetched ${words.length} favorites');
      words.isEmpty ? emit(const FavoritesState.empty()) : emit(FavoritesState.content(words: words));
    } catch (exception, stackTrace) {
      WWLogger.e(message: exception.toString(), exception: exception, stackTrace: stackTrace);
      emit(const FavoritesState.error());
    }
  }
}
