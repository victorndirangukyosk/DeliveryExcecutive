import 'package:freezed_annotation/freezed_annotation.dart';

part 'apiresponse.freezed.dart';
part 'apiresponse.g.dart';

@freezed
class ApiResponse with _$ApiResponse {
  factory ApiResponse({bool? success}) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}
