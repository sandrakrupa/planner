import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(
          LoginInitial(),
        );

  bool isPasswordVisible = false;
  bool isRegistration = false;

  Future<void> login(String email, String password, bool isRegistration) async {
    try {
      if (isRegistration) {
        // registration
        if (password.length < 7) {
          emit(
            LoginError('Password should be at least 7 characters long.'),
          );
          return;
        }
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        // {
        //   try {
        //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
        //         email: email, password: password);
        //   } on FirebaseAuthException catch (e) {
        //     emit(
        //       LoginError(
        //         getErrorMessage(e, email, password),
        //       ),
        //     );
        //   } catch (e) {
        //     emit(
        //       LoginError('An error occurred. Please try again.'),
        //     );
        //   }
        // }

        // logging
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      }
      emit(
        LoginSuccess(),
      );
    } on FirebaseAuthException catch (e) {
      emit(
        LoginError(
          getErrorMessage(
            e,
            email,
            password,
          ),
        ),
      );
    } catch (e) {
      emit(
        LoginError('An error occurred. Please try again.'),
      );
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(
      LoginPasswordVisibilityChanged(isPasswordVisible: isPasswordVisible),
    );
  }

  void toggleRegistrationMode() {
    isRegistration = !isRegistration;
    emit(
      LoginRegistrationModeChanged(isRegistration: isRegistration),
    );
  }

  String getErrorMessage(
    FirebaseAuthException exception,
    String email,
    String password,
  ) {
    switch (exception.code) {
      case 'invalid-email':
        return 'Invalid email address.';
      case 'user-disabled':
        return 'Your account has been disabled.';
      case 'user-not-found':
        return 'User not found.';
      case 'wrong-password':
        return 'Invalid password.';
      case 'weak-password':
        return 'Password should be at least 7 characters long.';
      default:
        if (email.isEmpty || password.isEmpty) {
          return 'Email and password cannot be empty.';
        } else {
          return 'An error occurred. Please try again.';
        }
    }
  }
}
