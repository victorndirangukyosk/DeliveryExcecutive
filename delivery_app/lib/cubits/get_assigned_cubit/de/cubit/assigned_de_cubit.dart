import 'package:bloc/bloc.dart';
import 'package:delivery_app/models/assigned/de/assigned_de.dart';
import 'package:delivery_app/utilities/rest_client/rest_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'assigned_de_state.dart';
part 'assigned_de_cubit.freezed.dart';

class AssignedDeCubit extends Cubit<AssignedDeState> {
  AssignedDeCubit() : super(AssignedDeState.initial());
    getAssignedDeOrders() async {
    emit(const AssignedDeState.loading());
    try {
      var response = await RestClient().dio!.get(
            'https://stage.apiadmin.kwikbasket.com/api/deliveryexecutive/getOrders',
            queryParameters: {
              'order_status_id': 3,
            }
          );
      List ordersinJson = response.data['data']['orders'];
      List<AssignedDe> ordersde = List.generate(ordersinJson.length,
          ((index) => AssignedDe.fromJson(ordersinJson[index])));

      // Map<String, dynamic> map = json.decode(response.data['data']);
      // // ignore: prefer_typing_uninitialized_variables
      // var ordersinJson;
      // List<AssignedOrder> orders = List.generate(ordersinJson.length,
      //     ((index) => AssignedOrder.fromJson(ordersinJson[index])));
      // print(orders[0]);

      emit(AssignedDeState.success(ordersde));
    } catch (e) {
      emit(AssignedDeState.failed(e.toString()));
    }
  }
}
