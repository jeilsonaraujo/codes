import 'package:word_wise/app/app.dart';
import 'package:word_wise/core/core.dart';
import 'package:word_wise/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjection();
  await inject<AuthService>().getSignedUser();

  runApp(App(router: inject<AppRouter>()));
}
