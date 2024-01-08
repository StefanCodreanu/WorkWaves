import 'package:workwaves/core/entities/user.dart';

abstract class AuthenticationRepository {
  Future<Human?> getCurrentUser();
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();

  isUserSignedIn() {}
}
