import 'package:word_wise/app/components/word_definition_widget.dart';
import 'package:word_wise/core/core.dart';
import 'package:word_wise/dto/word_detail_meaning_dto.dart';

class WordDetailMeaningsWidget extends StatelessWidget {
  const WordDetailMeaningsWidget({super.key, required this.meanings});
  final List<WordDetailMeaningDto> meanings;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: List.generate(meanings.length, (index) {
        final meaning = meanings[index];
        final definitions = meaning.definitions;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(meaning.partOfSpeech, style: AppTextTheme.titleLarge),
            WordDetailDefinitionsWidget(definitions: definitions),
          ],
        );
      })),
    );
  }
}
