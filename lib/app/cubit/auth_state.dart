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

// class AuthInitial extends AuthState {}

// class AuthAuthenticated extends AuthState {
//   final User user;
//   AuthAuthenticated({required this.user});
// }

// class AuthUnauthenticated extends AuthState {}

// class AuthError extends AuthState {
//   final String errorMessage;

//   AuthError(this.errorMessage);
// }
