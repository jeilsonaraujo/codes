import 'package:word_wise/core/core.dart';

class LinkButtonWidget extends StatefulWidget {
  const LinkButtonWidget({super.key, required this.onTap, required this.text, this.padding = const EdgeInsets.all(4.0)});
  final Function() onTap;
  final Text text;
  final EdgeInsets padding;
  @override
  State<LinkButtonWidget> createState() => _LinkButtonWidgetState();
}

class _LinkButtonWidgetState extends State<LinkButtonWidget> {
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
