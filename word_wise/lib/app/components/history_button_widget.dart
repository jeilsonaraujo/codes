import 'package:flutter/material.dart';
import 'package:word_wise/dto/word_history_dto.dart';

class HistoryWidgetButton extends StatelessWidget {
  const HistoryWidgetButton({super.key, required this.wordHistory, this.onTap});
  final WordHistoryDto wordHistory;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final historyDateTime = DateTime.parse(wordHistory.createdAt);
    final year = historyDateTime.year;
    final month = historyDateTime.month.toString().padLeft(2, '0');
    final day = historyDateTime.day.toString().padLeft(2, '0');
    final hour = historyDateTime.hour.toString().padLeft(2, '0');
    final minute = historyDateTime.minute.toString().padLeft(2, '0');
    final second = historyDateTime.second.toString().padLeft(2, '0');

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        elevation: 3,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 60,
            decoration: const BoxDecoration(
              color: Color(0xFFA2D2FE),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const Icon(Icons.history_toggle_off_sharp, size: 40),
                  const SizedBox(width: 14),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(wordHistory.wordName.toUpperCase(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Text('$day/$month/$year - $hour:$minute:$second', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
