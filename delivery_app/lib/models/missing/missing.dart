
import 'package:freezed_annotation/freezed_annotation.dart';

part 'missing.freezed.dart';
part 'missing.g.dart';

@freezed
class Missing with _$Missing {
  factory Missing(
   String? prouct_id,
   String? quantity,
   String? quantity_required,
   String? comment,

  ) = _Missing;
	
  factory Missing.fromJson(Map<String, dynamic> json) =>
			_$MissingFromJson(json);
}
