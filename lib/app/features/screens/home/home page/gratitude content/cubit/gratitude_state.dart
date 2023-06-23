part of 'gratitude_cubit.dart';

@immutable
class GratitudeState {
  const GratitudeState({
    this.items,
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });
  final QuerySnapshot<Map<String, dynamic>>? items;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}
