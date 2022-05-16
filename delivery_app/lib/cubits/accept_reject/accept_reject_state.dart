part of 'accept_reject_cubit.dart';

@freezed
class AcceptRejectState with _$AcceptRejectState {
  const factory AcceptRejectState.initial() = _Initial;
  const factory AcceptRejectState.loading() = _Loading;
  const factory AcceptRejectState.success() = _Success;
  const factory AcceptRejectState.failed(String error) = _Error;
}
