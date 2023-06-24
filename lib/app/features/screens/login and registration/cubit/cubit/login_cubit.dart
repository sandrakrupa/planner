import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:planner/app/core/enums.dart';
import 'package:planner/app/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository)
      : super(
          LoginState(status: Status.initial),
        );

  bool isPasswordVisible = false;
  bool isRegistration = false;

  Future<void> login(String email, String password, bool isRegistration) async {
    try {
      if (isRegistration) {
        // registration
        await _authRepository.registerUser(email, password);
      } else {
        // logging
        await _authRepository.loginUser(email, password);
      }
      emit(
        LoginState(
          status: Status.success,
        ),
      );
    }
    // emit(
    //   LoginState(

    //     status: Status.error,
    //     errorMessage:
    //         _authRepository.getExceptionMessage(e.toString(), email, password),
    //   ),
    // );

    on FirebaseAuthException catch (e) {
      emit(
        LoginState(
          status: Status.error,
          errorMessage: getErrorMessage(e, email, password),
        ),
      );
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(
      LoginState(
        status: Status.initial,
        isPasswordVisible: isPasswordVisible,
      ),
    );
  }

  void toggleRegistrationMode() {
    isRegistration = !isRegistration;
    emit(
      LoginState(
        status: Status.initial,
        isRegistration: isRegistration,
      ),
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
