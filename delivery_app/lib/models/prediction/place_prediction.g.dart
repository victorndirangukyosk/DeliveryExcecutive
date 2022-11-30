// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_prediction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PlacePrediction _$$_PlacePredictionFromJson(Map<String, dynamic> json) =>
    _$_PlacePrediction(
      json['structured_formatting'] == null
          ? null
          : StructuredFormatting.fromJson(
              json['structured_formatting'] as Map<String, dynamic>),
      json['description'] as String?,
    );

Map<String, dynamic> _$$_PlacePredictionToJson(_$_PlacePrediction instance) =>
    <String, dynamic>{
      'structured_formatting': instance.structured_formatting,
      'description': instance.description,
    };
