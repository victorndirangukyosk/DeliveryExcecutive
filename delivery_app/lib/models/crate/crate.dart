import 'package:freezed_annotation/freezed_annotation.dart';

part 'crate.freezed.dart';
part 'crate.g.dart';

@freezed
class Crate with _$Crate {
  factory Crate({
    String? serial_number,
    String? color,
    String? department,
    String? purchase_date,
  }) = _Crate;

  factory Crate.fromJson(Map<String, dynamic> json) => _$CrateFromJson(json);
}
