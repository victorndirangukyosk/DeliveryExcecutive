part of 'change_order_statuses_cubit.dart';

@freezed
class ChangeOrderStatusesState with _$ChangeOrderStatusesState{
  const factory ChangeOrderStatusesState.initial() = _Initial;
  const factory ChangeOrderStatusesState.loading() = _Loading;
  const factory ChangeOrderStatusesState.success() = _Success;
  const factory ChangeOrderStatusesState.failed(String error) = _Failed;

  // static ChangeOrderStatusesState success(List<ChangeOrderStatus> list) {}
}
