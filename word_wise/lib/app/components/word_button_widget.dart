import 'package:flutter/material.dart';

class WordButtonWidget extends StatelessWidget {
  const WordButtonWidget({super.key, required this.label, this.onTap});
  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(color: const Color(0xFF67549E), borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
