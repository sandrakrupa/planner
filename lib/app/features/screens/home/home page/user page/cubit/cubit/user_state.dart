part of 'user_cubit.dart';

@immutable
class UserState {
  const UserState({
    this.names = const [],
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });

  final List<NameModel> names;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}
