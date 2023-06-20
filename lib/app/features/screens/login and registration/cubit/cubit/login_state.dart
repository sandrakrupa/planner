part of 'login_cubit.dart';

class LoginState {
  final Status status;
  final String? errorMessage;
  final bool isPasswordVisible;
  final bool isRegistration;

  LoginState({
    required this.status,
    this.errorMessage,
    this.isPasswordVisible = false,
    this.isRegistration = false,
  });
}
