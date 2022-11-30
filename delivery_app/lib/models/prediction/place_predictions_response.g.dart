// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_predictions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlacePredictionsResponse _$$_PlacePredictionsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_PlacePredictionsResponse(
      predictions: (json['predictions'] as List<dynamic>?)
          ?.map((e) => PlacePrediction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PlacePredictionsResponseToJson(
        _$_PlacePredictionsResponse instance) =>
    <String, dynamic>{
      'predictions': instance.predictions,
    };
