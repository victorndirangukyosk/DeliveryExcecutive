part of 'o_details_de_cubit.dart';

@freezed
class ODetailsDeState with _$ODetailsDeState {
  const factory ODetailsDeState.initial() = _Initial;
  const factory ODetailsDeState.loading() = _Loading;
  const factory ODetailsDeState.success({
    List<OdetailsDe>? odeDetailsList,
    // List<ProcessedProducts>? status,
  }) = _Success;
  const factory ODetailsDeState.failed(String error) = _Failed;
}
