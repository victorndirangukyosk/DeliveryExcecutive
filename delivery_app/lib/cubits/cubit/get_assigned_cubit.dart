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
      var response = await Dio().get(
          'https://stage.apiadmin.kwikbasket.com/api/deliveryexecutive/getOrders',
          options: Options(headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZWxpdmVyeV9leGVjdXRpdmVfaWQiOjM1LCJmaXJzdG5hbWUiOiJzcmkiLCJsYXN0bmFtZSI6ImRpdnlhIiwiZW1haWwiOiJzdGFsbHVyaUB0ZWNobm9icmFpbmdyb3VwLmNvbSIsInRlbGVwaG9uZSI6IjY1NDU2Nzg1NDQiLCJpYXQiOjE2NDU1NDc1MDUsImV4cCI6MTY0NTYzMzkwNX0.T8uatBj40Z9hbNfWJ4CjSNUCj0Y3fbiuobS0BujaNx0'
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