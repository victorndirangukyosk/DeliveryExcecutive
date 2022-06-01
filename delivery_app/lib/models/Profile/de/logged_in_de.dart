
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logged_in_de.freezed.dart';
part 'logged_in_de.g.dart';

@freezed
class LoggedInDe with _$LoggedInDe {
  factory LoggedInDe(
    {
      String? firstname,
      String? lastname,
      String? email,
      String? date_added,
      String? username
    }
  ) = _LoggedInDe;
	
  factory LoggedInDe.fromJson(Map<String, dynamic> json) =>
			_$LoggedInDeFromJson(json);
}
