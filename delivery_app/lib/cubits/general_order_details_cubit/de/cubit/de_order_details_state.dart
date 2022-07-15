part of 'de_order_details_cubit.dart';

@freezed
class DeOrderDetailsState with _$DeOrderDetailsState {
  const factory DeOrderDetailsState.initial() = _Initial;
  const factory DeOrderDetailsState.loading() = _Loading;
  const factory DeOrderDetailsState.success(GeneralDetails generalDetails) = _Success;
  const factory DeOrderDetailsState.failed(String error) = _Failed;
}
