part of 'details_gratitude_cubit.dart';

@immutable
class GratitudeDetailsState {
  const GratitudeDetailsState({
    required this.itemModel,
    this.loadingErrorOccured = false,
  });
  final ItemModel? itemModel;
  final bool loadingErrorOccured;
}
