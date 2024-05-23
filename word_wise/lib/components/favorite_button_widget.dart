import 'package:flutter/material.dart';

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
              color: Color.fromARGB(255, 255, 231, 160),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 10),
                const Icon(Icons.star_border_purple500_outlined),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(child: Text(label.toUpperCase(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
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
