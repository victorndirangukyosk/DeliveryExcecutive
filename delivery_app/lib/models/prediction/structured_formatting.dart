
import 'package:freezed_annotation/freezed_annotation.dart';

part 'structured_formatting.freezed.dart';
part 'structured_formatting.g.dart';

@freezed
class StructuredFormatting with _$StructuredFormatting {
  factory StructuredFormatting({
    String? main_text,
    String? secondary_text
  }) = _StructuredFormatting;
	
  factory StructuredFormatting.fromJson(Map<String, dynamic> json) =>
			_$StructuredFormattingFromJson(json);
}
