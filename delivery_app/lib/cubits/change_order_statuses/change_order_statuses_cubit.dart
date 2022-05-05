import 'package:bloc/bloc.dart';
import 'package:delivery_app/models/change_order_status/change_order_status.dart';
import 'package:delivery_app/services/api_service/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_order_statuses_state.dart';
part 'change_order_statuses_cubit.freezed.dart';

class ChangeOrderStatusesCubit extends Cubit<ChangeOrderStatusesState> {
  ChangeOrderStatusesCubit() : super(ChangeOrderStatusesState.initial());

  changeOrderStatus(
      {required List<ChangeOrderStatus> neworderStatus,
      required int orderId}) async {
    emit(const ChangeOrderStatusesState.loading());
    try {
      await ApiService.post(data: {
        'order_id': orderId,
        'order_status_id': List.generate(
            neworderStatus.length, (index) => neworderStatus[index].toJson())
      }, path: 'deliveryexecutive/orderStatus');
      emit(const ChangeOrderStatusesState.success());
    } catch (e) {
      emit(ChangeOrderStatusesState.failed(e.toString()));
    }
  }
}
