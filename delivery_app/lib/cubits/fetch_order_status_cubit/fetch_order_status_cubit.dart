import 'package:bloc/bloc.dart';
import 'package:delivery_app/services/api_service/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:delivery_app/models/order_status.dart';

part 'fetch_order_status_state.dart';
part 'fetch_order_status_cubit.freezed.dart';

class FetchOrderStatusCubit extends Cubit<FetchOrderStatusState> {
  FetchOrderStatusCubit() : super(FetchOrderStatusState.initial());

  fetchOrderStatuses() async {
    emit(FetchOrderStatusState.loading());
    try {
      var response = await ApiService.get(path: 'getOrderStatuses');
      List data = response['data'];
      emit(FetchOrderStatusState.success(List.generate(
          data.length, (index) => OrderStatus.fromJson(data[index]))));
    } catch (e) {
      emit(FetchOrderStatusState.failed(e.toString()));
    }
  }
}
