part of 'location_prediction_display_cubit.dart';

@freezed
class LocationPredictionDisplayState with _$LocationPredictionDisplayState {
  const factory LocationPredictionDisplayState.initial() = _Initial;
  const factory LocationPredictionDisplayState.loading() = _Loading;

  const factory LocationPredictionDisplayState.success(List<PlacePrediction> predictions) = _Success;
  const factory LocationPredictionDisplayState.failed(String error) = _Failed;
}
