part of 'update_invoice_cubit.dart';

@freezed
class UpdateInvoiceState with _$UpdateInvoiceState {
  const factory UpdateInvoiceState.initial() = _Initial;
  const factory UpdateInvoiceState.loading() = _Loading;
  const factory UpdateInvoiceState.success() = _Success;
  const factory UpdateInvoiceState.failed(String error) = _Failed;
}
