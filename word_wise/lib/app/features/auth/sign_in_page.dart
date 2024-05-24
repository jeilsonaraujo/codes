import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:word_wise/app/components/input_form.dart';
import 'package:word_wise/app/components/link.dart';
import 'package:word_wise/app/components/primary.dart';
import 'package:word_wise/app/features/words_page/words_page.dart';
import 'package:word_wise/app/theme/app_colors.dart';
import 'package:word_wise/core/core.dart';
import 'package:word_wise/gen/assets.gen.dart';
import 'package:word_wise/services/auth_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with SingleTickerProviderStateMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white900,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.primary900),
        elevation: 0,
        toolbarHeight: 80,
        centerTitle: false,
        backgroundColor: AppColors.white900,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: GestureDetector(
            child: const Icon(Icons.chevron_left, size: 35),
            onTap: () => context.go('/${WordsPage.path}'),
          ),
        ),
        leadingWidth: 40,
        title: Text(AppLocalizations.of(context)!.authSignIn, style: AppTextTheme.headlineMedium.copyWith(color: AppColors.primary900)),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: AppColors.primary100),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    AppLocalizations.of(context)!.authSignInPageWelcome,
                    style: AppTextTheme.headlineSmall.copyWith(color: AppColors.primary900),
                  ),
                  Text(
                    AppLocalizations.of(context)!.authSignInPageSignInToContinue,
                    style: AppTextTheme.bodyLarge.copyWith(color: AppColors.primary800),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Center(child: SizedBox(height: 165, child: Lottie.asset(Assets.lotties.waitingLogin))),
                  ),
                  InputForm(
                    hintText: AppLocalizations.of(context)!.authSignInPageEmail,
                    controller: emailController,
                  ),
                  InputForm(
                    hintText: AppLocalizations.of(context)!.authSignInPagePassword,
                    obscureText: true,
                    controller: passwordController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonLink(
                        padding: const EdgeInsets.only(),
                        onTap: () {},
                        text: Text(
                          AppLocalizations.of(context)!.authSignInPageForgotPassword,
                          style: AppTextTheme.bodyLarge.copyWith(color: AppColors.primary800),
                        ),
                      ),
                    ],
                  ),
                  ButtonPrimary(
                    padding: const EdgeInsets.only(top: 40),
                    text: AppLocalizations.of(context)!.authSignIn,
                    onTap: () async {
                      final auth = inject<AuthService>();
                      try {
                        await auth.signInWithPassword(email: emailController.text, password: passwordController.text);
                        if (context.mounted) context.go('/${WordsPage.path}');
                      } catch (e) {
                        if (context.mounted) {
                          final snackBar = SnackBar(
                            backgroundColor: AppColors.error700,
                            content: Text(AppLocalizations.of(context)!.authSignInPageErrorLoginSnackbarMessage),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                    },
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
