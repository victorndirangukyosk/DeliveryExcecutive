import 'package:delivery_app/models/prediction/structured_formatting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_prediction.freezed.dart';
part 'place_prediction.g.dart';

@freezed
class PlacePrediction with _$PlacePrediction {
  factory PlacePrediction(
          StructuredFormatting? structured_formatting, String? description) =
      _PlacePrediction;

  factory PlacePrediction.fromJson(Map<String, dynamic> json) =>
      _$PlacePredictionFromJson(json);
}
