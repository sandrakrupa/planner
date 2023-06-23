part of 'gratitude_cubit.dart';

@immutable
class GratitudeState {
  const GratitudeState({
    this.items = const [],
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });
  final List<ItemModel> items;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}
