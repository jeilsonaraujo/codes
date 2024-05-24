import 'package:flutter/material.dart';
import 'package:word_wise/app/theme/app_colors.dart';
import 'package:word_wise/app/theme/app_text_theme.dart';

class FavoriteButtonWidget extends StatelessWidget {
  const FavoriteButtonWidget({super.key, required this.label, this.onTap});
  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        elevation: 4,
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 50,
            decoration: const BoxDecoration(
              color: AppColors.primary400,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Icon(
                    Icons.star_border_purple500_outlined,
                    color: AppColors.white900,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        label.toUpperCase(),
                        style: AppTextTheme.bodyLarge.copyWith(color: AppColors.white900),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
