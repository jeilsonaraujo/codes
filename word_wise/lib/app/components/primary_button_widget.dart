import 'package:word_wise/app/theme/app_colors.dart';
import 'package:word_wise/core/core.dart';

class PrimaryButtonWidget extends StatefulWidget {
  const PrimaryButtonWidget({super.key, this.onTap, required this.text, this.padding = const EdgeInsets.all(4.0)});
  final Function()? onTap;
  final String text;
  final EdgeInsets padding;
  @override
  State<PrimaryButtonWidget> createState() => _PrimaryButtonWidgetState();
}

class _PrimaryButtonWidgetState extends State<PrimaryButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Material(
        borderRadius: BorderRadius.circular(15),
        color: widget.onTap != null ? AppColors.primary700 : AppColors.primary200,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: widget.onTap,
          child: SizedBox(
            height: 44,
            child: Center(child: Text(widget.text, style: AppTextTheme.labelLarge.copyWith(color: AppColors.white900))),
          ),
        ),
      ),
    );
  }
}
