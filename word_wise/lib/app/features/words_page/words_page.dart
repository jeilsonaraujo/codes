import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_wise/app/components/word_button_widget.dart';
import 'package:word_wise/app/features/word_definition_page/word_definition_page.dart';
import 'package:word_wise/app/features/words_page/words_cubit.dart';
import 'package:word_wise/app/features/words_page/words_state.dart';
import 'package:word_wise/core/inject.dart';

class WordsPage extends StatefulWidget {
  const WordsPage({super.key});
  static String get path => 'words';

  @override
  State<WordsPage> createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> {
  final wordsCubit = inject<WordsCubit>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => wordsCubit.load());
    scrollController.addListener(_scrollListener);

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  final ScrollController scrollController = ScrollController();

  _scrollListener() {
    const spaceBeforeEndOfScroll = 50;
    if (scrollController.offset >= scrollController.position.maxScrollExtent - spaceBeforeEndOfScroll && !scrollController.position.outOfRange) {
      wordsCubit.paginate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WordsCubit, WordsState>(
        bloc: wordsCubit,
        builder: (context, state) {
          return Scaffold(body: Builder(
            builder: (context) {
              if (state.isLoading) return const Center(child: Text('Loading'));
              if (state.isError) const Center(child: Text('Error'));
              if (state.isEmpty) const Center(child: Text('Empty'));

              final words = state.getWords;
              const itemsByRow = 3;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: GridView.count(
                    controller: scrollController,
                    crossAxisCount: itemsByRow,
                    childAspectRatio: (8 / 4),
                    physics: const RangeMaintainingScrollPhysics(),
                    children: [
                      ...List.generate(
                          words.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: WordButtonWidget(
                                  label: words[index].toUpperCase(),
                                  onTap: () => WordDefinitionPage.push(
                                    context,
                                    word: words[index],
                                  ),
                                ),
                              )),
                      ...[if (state.isPaginating) const Center(child: CircularProgressIndicator())],
                    ]),
              );
            },
          ));
        },
      ),
    );
  }
}
