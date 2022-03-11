part of 'add_crates_cubit.dart';

@freezed
class AddCratesState with _$AddCratesState {
  const factory AddCratesState.initial() = _Initial;
  const factory AddCratesState.loading() = _Loading;
  const factory AddCratesState.success() = _Success;
  const factory AddCratesState.failed(String error) = _Error;
}
