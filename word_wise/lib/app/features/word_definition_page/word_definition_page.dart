import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:word_wise/app/features/history_page/history_page.dart';
import 'package:word_wise/app/features/word_definition_page/word_definition_cubit.dart';
import 'package:word_wise/app/features/word_definition_page/word_definition_state.dart';
import 'package:word_wise/core/inject.dart';

class WordDefinitionPage extends StatefulWidget {
  const WordDefinitionPage({super.key, required this.word});
  final String word;

  static String get path => 'word_definition';

  static push(BuildContext context, {required String word}) => context.go('/words/$path/$word');

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<WordDefinitionCubit, WordDefinitionState>(
        bloc: wordDefinitionCubit,
        builder: (context, state) => state.when(
          error: () => const Center(child: Text('Error')),
          loading: () => const Center(child: Text('Loading')),
          content: (wordDetail) => Column(
            children: [Text(wordDetail.word ?? '')],
          ),
        ),
      ),
    );
  }
}
