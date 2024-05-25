import 'package:word_wise/app/components/empty_widget.dart';
import 'package:word_wise/app/components/history_button_widget.dart';
import 'package:word_wise/app/components/loading_widget.dart';
import 'package:word_wise/app/components/not_found_widget.dart';
import 'package:word_wise/app/features/history_page/history_cubit.dart';
import 'package:word_wise/app/features/history_page/history_page.dart';
import 'package:word_wise/app/features/history_page/history_state.dart';
import 'package:word_wise/app/features/word_definition_page/word_definition_page.dart';
import 'package:word_wise/app/theme/app_colors.dart';
import 'package:word_wise/core/core.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});
  static String get path => 'history';

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final wordsCubit = inject<HistoryCubit>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => wordsCubit.load());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: AppColors.white100,
        elevation: 0,
        title: Text(AppLocalizations.of(context)!.historyPageTitle, style: AppTextTheme.headlineSmall.copyWith(color: AppColors.primary900)),
        surfaceTintColor: AppColors.primary900,
        actionsIconTheme: const IconThemeData(color: AppColors.primary900),
        leadingWidth: 30,
        iconTheme: const IconThemeData(color: AppColors.primary900),
      ),
      body: BlocBuilder<HistoryCubit, HistoryState>(
        bloc: wordsCubit,
        builder: (context, state) {
          return Scaffold(body: Builder(
            builder: (context) {
              if (state.isLoading) return LoadingWidget(message: AppLocalizations.of(context)!.historyPageLoadingMessage);
              if (state.isError) return NotFoundWidget(message: AppLocalizations.of(context)!.historyPageErrorMessage);
              if (state.isEmpty) return EmptyWidget(message: AppLocalizations.of(context)!.historyPageEmptyMessage);

              final words = state.getWords;
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ListView.builder(
                    itemCount: words.length,
                    itemBuilder: (context, index) => HistoryWidgetButton(
                      wordHistory: words[index],
                      onTap: () => WordDefinitionPage.go(context, root: HistoryPage.path, word: words[index].wordName),
                    ),
                  ));
            },
          ));
        },
      ),
    );
  }
}
