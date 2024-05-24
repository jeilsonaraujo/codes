import 'package:word_wise/core/core.dart';

class ButtonLink extends StatefulWidget {
  const ButtonLink({super.key, required this.onTap, required this.text, this.padding = const EdgeInsets.all(4.0)});
  final Function() onTap;
  final Text text;
  final EdgeInsets padding;
  @override
  State<ButtonLink> createState() => _ButtonLinkState();
}

class _ButtonLinkState extends State<ButtonLink> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: GestureDetector(
        onTap: widget.onTap,
        child: widget.text,
      ),
    );
  }
}
