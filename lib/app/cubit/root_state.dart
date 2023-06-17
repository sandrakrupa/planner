part of 'root_cubit.dart';

@immutable
abstract class RootState {}

class RootInitial extends RootState {}

class RootAuthenticated extends RootState {
  final User user;

  RootAuthenticated({required this.user});
}

class RootUnauthenticated extends RootState {}

class RootError extends RootState {
  final String errorMessage;

  RootError(this.errorMessage);
}
