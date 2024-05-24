import 'package:word_wise/core/core.dart';
import 'package:word_wise/dto/word_detail_definitions_dto.dart';

class WordDetailDefinitionsWidget extends StatelessWidget {
  const WordDetailDefinitionsWidget({super.key, required this.definitions});
  final List<WordDetailDefinitionsDto> definitions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(definitions.length, (index) {
        final definition = definitions[index].definition;
        final example = definitions[index].example;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(definition, style: AppTextTheme.titleSmall),
              Text(example, style: AppTextTheme.bodyMedium.copyWith(fontStyle: FontStyle.italic)),
            ],
          ),
        );
      }),
    );
  }
}
