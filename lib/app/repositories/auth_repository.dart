import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  Future<void> registerUser(String email, String password) async {
    // try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // } on FirebaseAuthException catch (e) {
    //   throw getExceptionMessage(e, email, password,);
    // }
  }

  Future<void> loginUser(String email, String password) async {
    // try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    // }
    // on FirebaseAuthException catch (e) {
    //   throw getExceptionMessage(e, email, password,);
    // }
  }

  // String getExceptionMessage(
  //   FirebaseAuthException exception,
  //   String email,
  //   String password,
  // ) {
  //   switch (exception.code) {
  //     case 'invalid-email':
  //       return 'Invalid email address.';
  //     case 'user-disabled':
  //       return 'Your account has been disabled.';
  //     case 'user-not-found':
  //       return 'User not found.';
  //     case 'wrong-password':
  //       return 'Invalid password.';
  //     case 'weak-password':
  //       return 'Password should be at least 7 characters long.';
  //     default:
  //       if (email.isEmpty || password.isEmpty) {
  //         return 'Email and password cannot be empty.';
  //       } else {
  //         return 'An error occurred. Please try again.';
  //       }
  //   }
  // }
}
