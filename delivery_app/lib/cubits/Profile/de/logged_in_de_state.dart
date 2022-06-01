part of 'logged_in_de_cubit.dart';

@freezed
class LoggedInDeState with _$LoggedInDeState {
   const factory LoggedInDeState.initial() = _Initial;
  const factory LoggedInDeState.loading() = _Loading;
  const factory LoggedInDeState.success(List<LoggedInDe> loggedinde) = _Success;
  const factory LoggedInDeState.error(String error) = _Error;
}
