import 'package:flutter/material.dart';
import 'package:word_wise/app/theme/app_colors.dart';
import 'package:word_wise/app/theme/app_text_theme.dart';

class WWNavBar extends StatefulWidget {
  const WWNavBar({super.key, required this.navigationItems});
  final List<Widget> navigationItems;

  @override
  State<WWNavBar> createState() => _WWNavBarState();
}

class _WWNavBarState extends State<WWNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.white900, boxShadow: [
        BoxShadow(
          color: AppColors.white100.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 5),
        ),
        BoxShadow(
          color: AppColors.black400.withOpacity(0.5),
          spreadRadius: 0.05,
          blurRadius: 5,
          offset: const Offset(0, -7),
        ),
      ]),
      height: 70,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: widget.navigationItems),
      ),
    );
  }
}

class WWNavItem extends StatefulWidget {
  const WWNavItem({super.key, required this.icon, required this.label, required this.selected, this.onTap});
  final IconData icon;
  final String label;
  final bool selected;
  final void Function()? onTap;

  @override
  State<WWNavItem> createState() => _WWNavItemState();
}

class _WWNavItemState extends State<WWNavItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: widget.selected ? 70 : 0,
              width: widget.selected ? 70 : 0,
              decoration: BoxDecoration(
                color: widget.selected ? AppColors.primary600 : AppColors.primary600.withOpacity(0),
                boxShadow: widget.selected
                    ? [
                        const BoxShadow(
                          color: AppColors.black400,
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: AppColors.black400.withOpacity(0),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(
            height: 70,
            width: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(widget.icon, size: 30, color: widget.selected ? AppColors.white900 : AppColors.primary600),
                Text(
                  widget.label,
                  style: AppTextTheme.bodySmall.copyWith(color: widget.selected ? AppColors.white900 : AppColors.primary600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
