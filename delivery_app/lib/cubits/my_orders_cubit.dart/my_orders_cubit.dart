import 'package:bloc/bloc.dart';
import 'package:delivery_app/models/order_details/order.dart';
import 'package:delivery_app/services/api_service/api_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_orders_state.dart';
part 'my_orders_cubit.freezed.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  MyOrdersCubit() : super(const MyOrdersState.initial());
  getMyOrders() async {
    emit(const MyOrdersState.loading());
    try {
      var response = await ApiService.getData(path: '/customer/order/orders');
      List data = response['data']['orders'];
      emit(MyOrdersState.success(
          List.generate(data.length, (index) => Order.fromJson(data[index]))));
    } catch (e) {
      emit(MyOrdersState.failed(e.toString()));
    }
  }
}
