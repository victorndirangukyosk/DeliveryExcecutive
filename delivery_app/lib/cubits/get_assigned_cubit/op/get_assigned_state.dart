part of 'get_assigned_cubit.dart';

@freezed
class GetAssignedState with _$GetAssignedState {
  const factory GetAssignedState.initial() = _Initial;
  const factory GetAssignedState.loading() = _Loading;
  const factory GetAssignedState.success(List<AssignedOrder> orders) = _Success;
  const factory GetAssignedState.failed(String string) = _Failed;
}
