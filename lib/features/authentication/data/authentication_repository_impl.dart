import 'package:firebase_auth/firebase_auth.dart';
import 'package:workwaves/core/entities/user.dart';
import 'package:workwaves/features/authentication/domain/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Human?> getCurrentUser() async {
    final User? firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser != null) {
      // Retrieve user role from Firestore or another source
      const role = 'user'; // Replace with your logic to get user role
      return Human(
          uid: firebaseUser.uid, email: firebaseUser.email!, role: role);
    }
    return null;
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  isUserSignedIn() {
    // TODO: implement isUserSignedIn
    throw UnimplementedError();
  }
}
