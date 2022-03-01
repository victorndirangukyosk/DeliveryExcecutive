import 'package:bloc/bloc.dart';
import 'package:delivery_app/models/order_details/order_details.dart';
import 'package:delivery_app/utilities/utilities.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_details_state.dart';
part 'order_details_cubit.freezed.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsState.initial());
  getOrderDetails({required int orderId}) async {
    emit(OrderDetailsState.loading());
    try {
      var response = await RestClient().dio!.get(
          'https://stage.apiadmin.kwikbasket.com/api/op/getorder/${orderId}');
      OrderDetails orderDetails =
          OrderDetails.fromJson(response.data['data'][0]);
      emit(OrderDetailsState.success(orderDetails));
    } catch (e) {
      emit(OrderDetailsState.failed(e.toString()));
    }
  }
}
