part of 'fetch_order_status_cubit.dart';

@freezed
class FetchOrderStatusState with _$FetchOrderStatusState {
  const factory FetchOrderStatusState.initial() = _Initial;
  const factory FetchOrderStatusState.loading() = _Loading;
  const factory FetchOrderStatusState.success(List<OrderStatus> statuses) =
      _Success;
  const factory FetchOrderStatusState.failed(String error) = _Failed;
}
