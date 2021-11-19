
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@freezed
class ApiResponse with _$ApiResponse {
  factory ApiResponse() = _ApiResponse;
	
  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
			_$ApiResponseFromJson(json);
}
