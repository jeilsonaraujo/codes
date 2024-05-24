import 'package:word_wise/dto/user_dto.dart';
import 'package:word_wise/wrappers/supabase_wrapper.dart';

class AuthService {
  final SupabaseWrapper supabaseWrapper;

  AuthService({required this.supabaseWrapper});

  UserDto? get applicationUser => _applicationUser;

  UserDto? _applicationUser;

  Future<void> signInWithPassword({required String email, required String password}) async {
    _applicationUser = await supabaseWrapper.signInWithPassword(email: email, password: password);
  }

  Future<void> getSignedUser() async {
    _applicationUser = await supabaseWrapper.getSignedUser();
  }

  Future<void> signOut() async {
    _applicationUser = await supabaseWrapper.signOut();
  }
}
