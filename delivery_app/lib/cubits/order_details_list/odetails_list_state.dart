part of 'odetails_list_cubit.dart';

@freezed
class OdetailsListState with _$OdetailsListState {
  const factory OdetailsListState.initial() = _Initial;
  const factory OdetailsListState.loading() = _Loading;
  const factory OdetailsListState.success({
    List<OdetailsList>? odetailsList,
    List<ProcessedProducts>? status,
  }) = _Success;
  const factory OdetailsListState.failed(String error) = _Failed;
}
