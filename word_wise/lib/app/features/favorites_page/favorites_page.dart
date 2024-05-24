import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_wise/app/components/favorite_button_widget.dart';
import 'package:word_wise/app/features/favorites_page/favorites_cubit.dart';
import 'package:word_wise/app/features/favorites_page/favorites_state.dart';
import 'package:word_wise/app/features/word_definition_page/word_definition_page.dart';
import 'package:word_wise/app/theme/app_colors.dart';
import 'package:word_wise/core/core.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});
  static String get path => 'favorites';

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final favoritesCubit = inject<FavoritesCubit>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => favoritesCubit.load());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        bloc: favoritesCubit,
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                leading: Container(),
                backgroundColor: AppColors.white100,
                shadowColor: Colors.transparent,
                title: Text(AppLocalizations.of(context)!.favoritesPageTitle, style: AppTextTheme.headlineSmall.copyWith(color: AppColors.primary900)),
                surfaceTintColor: AppColors.primary900,
                actionsIconTheme: const IconThemeData(color: AppColors.primary900),
                leadingWidth: 30,
                iconTheme: const IconThemeData(color: AppColors.primary900),
              ),
              body: Builder(
                builder: (context) {
                  if (state.isLoading) return const Center(child: Text('Loading'));
                  if (state.isError) return const Center(child: Text('Error'));
                  if (state.isEmpty) return const Center(child: Text('Empty'));

                  final words = state.getWords;

                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: ListView.builder(
                        itemCount: words.length,
                        itemBuilder: (context, index) => FavoriteButtonWidget(
                          label: words[index],
                          onTap: () => WordDefinitionPage.go(context, root: FavoritesPage.path, word: words[index]),
                        ),
                      ));
                },
              ));
        },
      ),
    );
  }
}
