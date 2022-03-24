part of 'assigned_de_cubit.dart';

@freezed
class AssignedDeState with _$AssignedDeState {
  const factory AssignedDeState.initial() = _Initial;
  const factory AssignedDeState.loading() = _Loading;
  const factory AssignedDeState.success(List<AssignedDe> ordersde) =
      _Success;
  const factory AssignedDeState.failed(String string) = _Failed;
}
