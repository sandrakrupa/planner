part of 'auth_cubit.dart';

@immutable
class AuthState {
  final Status status;
  final String? errorMessage;
  final User? user;

  const AuthState({
    required this.status,
    this.errorMessage,
    this.user,
  });
}
