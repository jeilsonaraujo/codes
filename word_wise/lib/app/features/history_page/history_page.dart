import 'package:flutter/material.dart';
import 'package:word_wise/app/components/history_button_widget.dart';
import 'package:word_wise/app/features/history_page/history_cubit.dart';
import 'package:word_wise/app/features/history_page/history_page.dart';
import 'package:word_wise/app/features/history_page/history_state.dart';
import 'package:word_wise/app/features/word_definition_page/word_definition_page.dart';
import 'package:word_wise/core/inject.dart';

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
      body: BlocBuilder<HistoryCubit, HistoryState>(
        bloc: wordsCubit,
        builder: (context, state) {
          return Scaffold(body: Builder(
            builder: (context) {
              if (state.isLoading) return const Center(child: Text('Loading'));
              if (state.isError) return const Center(child: Text('Error'));
              if (state.isEmpty) return const Center(child: Text('Empty'));

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
