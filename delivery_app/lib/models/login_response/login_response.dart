
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  factory LoginResponse() = _LoginResponse;
	
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
			_$LoginResponseFromJson(json);
}
