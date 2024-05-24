import 'package:flutter/material.dart';

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
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: const Color(0xFFFEFEFE).withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 5), // changes position of shadow
        ),
        BoxShadow(
          color: const Color(0xFF343434).withOpacity(0.5),
          spreadRadius: 0.05,
          blurRadius: 5,
          offset: const Offset(0, -7), // changes position of shadow
        ),
      ]),
      height: 80,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: widget.navigationItems),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: widget.selected ? const Color(0xFF533673) : const Color(0xFFAC9DBD),
            boxShadow: widget.selected
                ? [
                    const BoxShadow(
                      color: Color(0xA1343434),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ]
                : [],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(widget.icon, size: 30, color: Colors.white),
              Text(
                widget.label,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
