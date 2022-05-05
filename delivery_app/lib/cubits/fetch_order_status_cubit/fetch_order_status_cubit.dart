import 'package:bloc/bloc.dart';
import 'package:delivery_app/models/fetch_order_status/order_status.dart';
import 'package:delivery_app/services/api_service/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'fetch_order_status_state.dart';
part 'fetch_order_status_cubit.freezed.dart';

class FetchOrderStatusCubit extends Cubit<FetchOrderStatusState> {
  FetchOrderStatusCubit() : super(FetchOrderStatusState.initial());

  fetchOrderStatuses() async {
    emit(FetchOrderStatusState.loading());
    try {
      var response =
          await ApiService.get(path: 'getOrderStatuses', queryParameters: {});
      List data = response['data'];
      var sada = List.generate(
          data.length, (index) => OrderStatus.fromJson(data[index]));
      emit(FetchOrderStatusState.success(sada
          .where((element) =>
              element.order_status_id == 1 || element.order_status_id == 17)
          .toList()));
    } catch (e) {
      emit(FetchOrderStatusState.failed(e.toString()));
    }
  }
}
