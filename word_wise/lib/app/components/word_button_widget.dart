import 'package:flutter/material.dart';
import 'package:word_wise/app/theme/app_colors.dart';

class WordButtonWidget extends StatelessWidget {
  const WordButtonWidget({super.key, required this.label, this.onTap});
  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: AppColors.primary500, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.white900,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
