
import 'package:delivery_app/models/prediction/place_prediction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_predictions_response.freezed.dart';
part 'place_predictions_response.g.dart';

@freezed
class PlacePredictionsResponse with _$PlacePredictionsResponse {
  factory PlacePredictionsResponse({
    List<PlacePrediction>? predictions
  }) = _PlacePredictionsResponse;
	
  factory PlacePredictionsResponse.fromJson(Map<String, dynamic> json) =>
			_$PlacePredictionsResponseFromJson(json);
}
