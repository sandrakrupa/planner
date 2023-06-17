part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginError extends LoginState {
  final String errorMessage;

  LoginError(this.errorMessage);
}

class LoginPasswordVisibilityChanged extends LoginState {
  final bool isPasswordVisible;

  LoginPasswordVisibilityChanged({required this.isPasswordVisible});
}

class LoginRegistrationModeChanged extends LoginState {
  final bool isRegistration;

  LoginRegistrationModeChanged({required this.isRegistration});
}
