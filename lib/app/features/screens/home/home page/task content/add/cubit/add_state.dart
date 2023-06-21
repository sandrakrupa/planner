part of 'add_cubit.dart';

@immutable
class AddState {
  const AddState({
    // required this.status,
    this.saved = false,
    this.errorMessage = '',
  });
  // final Status status;
  final bool saved;
  final String errorMessage;
}
