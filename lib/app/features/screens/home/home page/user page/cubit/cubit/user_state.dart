part of 'user_cubit.dart';

@immutable
class UserState {
  const UserState({
    required this.newName,
   required this.name,
    this.saved = false,
    this.errorMessage = '',
  });

  final String newName;
  final String name;
  final bool saved;
  final String errorMessage;
}
