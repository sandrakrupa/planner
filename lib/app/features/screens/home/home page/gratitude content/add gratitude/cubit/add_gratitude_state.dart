part of 'add_gratitude_cubit.dart';

@immutable
class AddGratitudeState {
  const AddGratitudeState({
    this.saved = false,
    this.errorMessage = '',
  });

  final bool saved;
  final String errorMessage;
}
