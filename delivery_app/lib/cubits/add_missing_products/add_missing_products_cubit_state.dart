part of 'add_missing_products_cubit_cubit.dart';

@freezed
class AddMissingProductsCubitState with _$AddMissingProductsCubitState {
  const factory AddMissingProductsCubitState.initial() = _Initial;
   const factory AddMissingProductsCubitState.loading() = _Loading;
    const factory AddMissingProductsCubitState.success() = _Success;
     const factory AddMissingProductsCubitState.failed( String error) = _Failed;

}
