part of 'get_order_statuses_cubit.dart';

@freezed
class GetOrderStatusesState with _$GetOrderStatusesState {
  const factory GetOrderStatusesState.initial() = _Initial;
  const factory GetOrderStatusesState.loading() = _Loading;
  const factory GetOrderStatusesState.success(List<GetOrdersState> status) = _Success;
  const factory GetOrderStatusesState.failed(String error) = _Failed;
}
