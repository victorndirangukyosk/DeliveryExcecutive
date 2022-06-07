part of 'customer_verification_cubit.dart';

@freezed
class CustomerVerificationState with _$CustomerVerificationState {
  const factory CustomerVerificationState.initial() = _Initial;
   const factory CustomerVerificationState.loading() = _Loading;
    const factory CustomerVerificationState.success() = _Success;
     const factory CustomerVerificationState.failed(String error) = _Failed;
}
