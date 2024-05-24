import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:word_wise/app/components/word_detail_meaning_widget.dart';
import 'package:word_wise/app/components/ww_button.dart';
import 'package:word_wise/app/features/history_page/history_page.dart';
import 'package:word_wise/app/features/word_definition_page/word_definition_cubit.dart';
import 'package:word_wise/app/features/word_definition_page/word_definition_state.dart';
import 'package:word_wise/app/theme/app_colors.dart';
import 'package:word_wise/core/core.dart';

class WordDefinitionPage extends StatefulWidget {
  const WordDefinitionPage({super.key, required this.word});
  final String word;

  static String get path => 'word_definition';

  static go(BuildContext context, {required String root, required String word}) => context.go('/$root/$path/$word');

  @override
  State<WordDefinitionPage> createState() => _WordDefinitionPageState();
}

class _WordDefinitionPageState extends State<WordDefinitionPage> {
  final wordDefinitionCubit = inject<WordDefinitionCubit>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => wordDefinitionCubit.load(word: widget.word));

    super.initState();
  }

  int currentPhonetics = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WordDefinitionCubit, WordDefinitionState>(
        bloc: wordDefinitionCubit,
        builder: (context, state) {
          return state.when(
              error: () => Scaffold(
                  appBar: AppBar(
                    backgroundColor: AppColors.white100,
                    shadowColor: Colors.transparent,
                    title: Text(AppLocalizations.of(context)!.wordDefinitionPageTitle, style: AppTextTheme.headlineSmall.copyWith(color: AppColors.primary900)),
                    surfaceTintColor: AppColors.primary900,
                    actionsIconTheme: const IconThemeData(color: AppColors.primary900),
                    leadingWidth: 30,
                    iconTheme: const IconThemeData(color: AppColors.primary900),
                  ),
                  body: const Center(child: Text('Error'))),
              loading: () => Scaffold(
                    appBar: AppBar(
                      backgroundColor: AppColors.white100,
                      shadowColor: Colors.transparent,
                      title: Text(AppLocalizations.of(context)!.wordDefinitionPageTitle, style: AppTextTheme.headlineSmall.copyWith(color: AppColors.primary900)),
                      surfaceTintColor: AppColors.primary900,
                      actionsIconTheme: const IconThemeData(color: AppColors.primary900),
                      leadingWidth: 30,
                      iconTheme: const IconThemeData(color: AppColors.primary900),
                    ),
                    body: const Center(child: Text('Loading')),
                  ),
              content: (wordDetail, isFavorite) {
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: AppColors.white100,
                    shadowColor: Colors.transparent,
                    title: Text(AppLocalizations.of(context)!.wordDefinitionPageTitle, style: AppTextTheme.headlineSmall.copyWith(color: AppColors.primary900)),
                    surfaceTintColor: AppColors.primary900,
                    actionsIconTheme: const IconThemeData(color: AppColors.primary900),
                    leadingWidth: 30,
                    iconTheme: const IconThemeData(color: AppColors.primary900),
                    actions: [
                      IconButton(
                          splashRadius: 20,
                          onPressed: () => wordDefinitionCubit.toggleFavorite(word: widget.word, userId: 'b57e89bf-279b-4edb-904d-b6da662a37a2'),
                          icon: Icon(isFavorite ? Icons.star : Icons.star_border_outlined))
                    ],
                  ),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Center(
                          child: Material(
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                            elevation: 4,
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                decoration: const BoxDecoration(
                                  color: AppColors.primary100,
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 16.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          wordDetail.word,
                                          style: AppTextTheme.headlineMedium,
                                        ),
                                      ),
                                      if (wordDetail.phonetics.isNotEmpty)
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            wordDetail.phonetics[currentPhonetics].text,
                                            style: AppTextTheme.headlineSmall,
                                          ),
                                        ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ),
                      if (wordDetail.meanings.isNotEmpty)
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.wordDefinitionPageMeanings,
                                  style: AppTextTheme.headlineMedium,
                                ),
                                Expanded(child: WordDetailMeaningsWidget(meanings: wordDetail.meanings)),
                              ],
                            ),
                          ),
                        ),
                      if (wordDetail.phonetics.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              WWButton(
                                  onTap: currentPhonetics != 0 ? () => setState(() => currentPhonetics--) : null,
                                  child: Row(children: [
                                    const Icon(Icons.arrow_back, color: AppColors.white900),
                                    const SizedBox(width: 8),
                                    Text(
                                      AppLocalizations.of(context)!.wordDefinitionPagePreviousPhonetic,
                                      style: AppTextTheme.titleSmall.copyWith(color: AppColors.white900),
                                    )
                                  ])),
                              WWButton(
                                  onTap: currentPhonetics + 1 < wordDetail.phonetics.length ? () => setState(() => currentPhonetics++) : null,
                                  child: Row(children: [
                                    Text(
                                      AppLocalizations.of(context)!.wordDefinitionPageNextPhonetic,
                                      style: AppTextTheme.titleSmall.copyWith(color: AppColors.white900),
                                    ),
                                    const SizedBox(width: 8),
                                    const Icon(Icons.arrow_forward, color: AppColors.white900)
                                  ])),
                            ],
                          ),
                        ),
                    ],
                  ),
                );
              });
        });
  }
}
