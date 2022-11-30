import 'package:bloc/bloc.dart';
import 'package:delivery_app/services/api_service/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_invoice_state.dart';
part 'update_invoice_cubit.freezed.dart';

class UpdateInvoiceCubit extends Cubit<UpdateInvoiceState> {
  UpdateInvoiceCubit() : super(UpdateInvoiceState.initial());

  updateInvoice({required int orderId}) async {
    emit(const UpdateInvoiceState.loading());
    try {
      await ApiService.post(data: {
        'order_id': orderId,
      }, path: 'deliveryexecutive/updateInvoice');
      emit(const UpdateInvoiceState.success());
    } catch (e) {
      emit(UpdateInvoiceState.failed(e.toString()));
    }
  }
}
