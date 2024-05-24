import 'package:lottie/lottie.dart';
import 'package:word_wise/app/theme/app_colors.dart';
import 'package:word_wise/core/core.dart';
import 'package:word_wise/gen/assets.gen.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Spacer(flex: 2),
        Expanded(
            child: Center(
                child: Wrap(
          children: [
            Text(message, style: AppTextTheme.headlineSmall.copyWith(color: AppColors.primary900), textAlign: TextAlign.center),
          ],
        ))),
        Expanded(flex: 8, child: Center(child: LottieBuilder.asset(Assets.lotties.empty))),
      ]),
    );
  }
}
