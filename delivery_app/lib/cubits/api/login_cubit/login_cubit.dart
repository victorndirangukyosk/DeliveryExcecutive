import 'package:bloc/bloc.dart';
import 'package:delivery_app/models/api_response/api_response.dart';
import 'package:delivery_app/models/login_response/login_response.dart';
import 'package:delivery_app/services/api_service/api_service.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  loginDE({required Map<String, dynamic> data}) async {
    emit(LoginLoading());
    try {
      ApiResponse apiResponse = ApiResponse.fromJson(
          await ApiService.post(data: data, path: 'deliveryexecutive/login'));
      LoginResponse loginResponse = LoginResponse.fromJson(apiResponse.data!);
      emit(LoginSuccess(loginResponse: loginResponse));
    } on String catch (e) {
      emit(LoginFailed(error: e));
    } catch (e) {
      emit(LoginFailed(error: 'An error has occured'));
    }
  }

  loginOP({required Map<String, dynamic> data}) async {
    emit(LoginLoading());
    try {
      ApiResponse apiResponse = ApiResponse.fromJson(
          await ApiService.post(data: data, path: 'op/login'));
      LoginResponse loginResponse = LoginResponse.fromJson(apiResponse.data!);
      emit(LoginSuccess(loginResponse: loginResponse));
    } on String catch (e) {
      emit(LoginFailed(error: e));
    } catch (e) {
      emit(LoginFailed(error: 'An error has occured'));
    }
  }
}
