import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:delivery_app/services/api_service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_verification_state.dart';
part 'customer_verification_cubit.freezed.dart';

class CustomerVerificationCubit extends Cubit<CustomerVerificationState> {
  CustomerVerificationCubit() : super(CustomerVerificationState.initial());

  verifyCustomer(File file,  int orderId) async {
    emit(const CustomerVerificationState.loading());
    try {
      var data=FormData.fromMap({
        'order_id': orderId,
        'profile':await MultipartFile.fromFile(file.path),
         'sign':await MultipartFile.fromFile(file.path)
      });
      await ApiService.post(data: data, path: 'deliveryexecutive/orderSignature');
    } catch (e) {
      emit(CustomerVerificationState.failed(e.toString()));
    }
  }
}
