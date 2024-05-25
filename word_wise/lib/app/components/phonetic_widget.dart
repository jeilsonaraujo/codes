import 'package:word_wise/app/components/player_widget.dart';
import 'package:word_wise/app/theme/app_colors.dart';
import 'package:word_wise/core/core.dart';
import 'package:word_wise/dto/word_detail_dto.dart';

class PhoneticWidget extends StatefulWidget {
  const PhoneticWidget({super.key, required this.wordDetail, required this.currentPhonetic});
  final WordDetailDto wordDetail;
  final int currentPhonetic;

  @override
  State<PhoneticWidget> createState() => _PhoneticWidgetState();
}

class _PhoneticWidgetState extends State<PhoneticWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
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
                    child: Text(widget.wordDetail.word, style: AppTextTheme.headlineMedium),
                  ),
                  if (widget.wordDetail.phonetics.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(widget.wordDetail.phonetics[widget.currentPhonetic].text, style: AppTextTheme.headlineSmall),
                          if (widget.wordDetail.phonetics[widget.currentPhonetic].audio.isNotEmpty)
                            PlayerWidget(
                                key: Key(widget.wordDetail.phonetics[widget.currentPhonetic].audio), location: widget.wordDetail.phonetics[widget.currentPhonetic].audio)
                        ],
                      ),
                    ),
                ],
              ),
            )),
      ),
    );
  }
}
