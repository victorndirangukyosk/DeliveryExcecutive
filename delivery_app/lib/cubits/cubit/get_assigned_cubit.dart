import 'package:bloc/bloc.dart';
import 'package:delivery_app/models/assigned/assigned_order.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_assigned_state.dart';
part 'get_assigned_cubit.freezed.dart';

class GetAssignedCubit extends Cubit<GetAssignedState> {
  GetAssignedCubit() : super(GetAssignedState.initial());
  getAssignedOrders() async {
    emit(const GetAssignedState.loading());
    try {
      var response = await Dio()
          .get('https://stage.apiadmin.kwikbasket.com/api/op/getorders',
              options: Options(headers: {
                'Authorization':
                    'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJvcmRlcl9wcm9jZXNzb3JfaWQiOjEsImZpcnN0bmFtZSI6InNyaSIsImxhc3RuYW1lIjoidGFsbHVyaSIsInVzZXJuYW1lIjoic3RhbGx1cmkiLCJpYXQiOjE2NDU4Njg4NjMsImV4cCI6MTY0NTk1NTI2M30.8TIC1Re32lf-m6CDgpM1EuGQ-D_tvi3f_-UeQCC8p2U'
              }));
      List ordersinJson = response.data['data'];
      List<AssignedOrder> orders = List.generate(ordersinJson.length,
          ((index) => AssignedOrder.fromJson(ordersinJson[index])));

      emit(GetAssignedState.success(orders));
    } catch (e) {
      emit(GetAssignedState.failed(e.toString()));
    }
  }
}


// try {
//       var response =
//           await Dio().post('https://localhost:44353/api/Books', data: data);
//       Book book = Book.fromJson(response.data);
//       emit(AddBookState.success(book));
//     } catch (e) {
//       emit(AddBookState.failed(e.toString()));
//     }