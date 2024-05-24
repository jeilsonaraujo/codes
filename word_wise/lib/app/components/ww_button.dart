import 'package:flutter/material.dart';
import 'package:word_wise/app/theme/app_colors.dart';

class WWButton extends StatelessWidget {
  const WWButton({super.key, required this.child, required this.onTap});
  final Widget child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onTap == null;

    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
            color: isDisabled ? AppColors.primary200 : AppColors.primary700,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: isDisabled
                ? []
                : const [
                    BoxShadow(
                      color: AppColors.black400,
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(1, 1),
                    ),
                  ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }
}
