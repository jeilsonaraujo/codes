import 'package:flutter/material.dart';
import 'package:word_wise/app/features/words_page/words_cubit.dart';
import 'package:word_wise/app/features/words_page/words_page.dart';
import 'package:word_wise/app/features/words_page/words_state.dart';
import 'package:word_wise/core/inject.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

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
              if (state is Loading) return const Center(child: Text('Loading'));
              if (state is Error) const Center(child: Text('Error'));
              if (state is Empty) const Center(child: Text('Empty'));

              final words = state is Content ? state.words : (state as Paginating).words;
              const itemsByRow = 3;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: GridView.count(controller: scrollController, crossAxisCount: itemsByRow, childAspectRatio: (6 / 3), children: [
                  ...List.generate(
                      words.length,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: const BoxDecoration(color: Color(0xFF6AA796), borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: Center(child: Text(words[index].toUpperCase(), style: const TextStyle(fontSize: 12))),
                            ),
                          )),
                  ...[if (state is Paginating) const Center(child: CircularProgressIndicator())],
                ]),
              );
            },
          ));
        },
      ),
    );
  }
}
