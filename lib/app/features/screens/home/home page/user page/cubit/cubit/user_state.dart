part of 'user_cubit.dart';

@immutable
class UserState {
  const UserState({
    this.names = const [],
    this.saved = false,
    this.errorMessage = '',
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });

  final List<NameModel> names;
  final bool saved;
  final String errorMessage;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}
