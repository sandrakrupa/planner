part of 'add_name_cubit.dart';

@immutable
class AddNameState {
  const AddNameState({
    this.saved = false,
   this.errorMessage = '',
  });

  final bool saved;
  final String errorMessage;
}
