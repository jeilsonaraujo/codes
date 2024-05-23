import 'package:flutter/material.dart';
import 'package:word_wise/app/features/history_page/history_cubit.dart';
import 'package:word_wise/app/features/history_page/history_page.dart';
import 'package:word_wise/app/features/history_page/history_state.dart';
import 'package:word_wise/components/history_button_widget.dart';
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
                      label: words[index],
                      dateTime: '2024-05-23T19:25:50.541029+00:00',
                    ),
                  ));
            },
          ));
        },
      ),
    );
  }
}
