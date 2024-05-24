import 'package:word_wise/app/theme/app_colors.dart';
import 'package:word_wise/core/core.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
            child: Wrap(
          children: [
            Text(message, style: AppTextTheme.headlineSmall.copyWith(color: AppColors.primary900), textAlign: TextAlign.center),
          ],
        )),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircularProgressIndicator(color: AppColors.primary900),
        ),
      ]),
    );
  }
}
