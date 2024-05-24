import 'package:word_wise/app/theme/app_colors.dart';
import 'package:word_wise/core/core.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key, required this.hintText, this.padding = const EdgeInsets.symmetric(vertical: 10), this.obscureText = false, this.controller});
  final String hintText;
  final EdgeInsets padding;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  State<InputForm> createState() => InputFormState();
}

class InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: SizedBox(
        height: 44,
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: AppColors.primary900),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            hintText: widget.hintText,
            hintStyle: AppTextTheme.labelLarge.copyWith(color: AppColors.primary900),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: AppColors.primary900),
            ),
          ),
        ),
      ),
    );
  }
}
