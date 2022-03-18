// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  factory LoginResponse(
      {num? delivery_executive_id,
      num? order_processor_id,
      String? firstname,
      num? status,
      String? date_added,
      String? username,
      String? telephone,
      num? order_processing_group_id,
      String? lastname,
      String? email,
      String? token}) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
