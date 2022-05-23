part of 'filter_flag_cubit.dart';

@freezed
class FilterFlagState with _$FilterFlagState {
  const factory FilterFlagState.initial() = _Initial;
  const factory FilterFlagState.loading() = _Loading;
  const factory FilterFlagState.success() = _Success;
  const factory FilterFlagState.failed(String error) = _Failed;
}
