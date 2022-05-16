
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accept_reject.freezed.dart';
part 'accept_reject.g.dart';

@freezed
class AcceptReject with _$AcceptReject {
  factory AcceptReject({
    String? status,
    String? comment
  }) = _AcceptReject;
	
  factory AcceptReject.fromJson(Map<String, dynamic> json) =>
			_$AcceptRejectFromJson(json);
}
