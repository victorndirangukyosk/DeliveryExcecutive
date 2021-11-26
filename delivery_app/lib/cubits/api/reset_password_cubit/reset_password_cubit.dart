import 'package:bloc/bloc.dart';
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/services/services.dart';
import 'package:equatable/equatable.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  resetPassword({required Map<String, dynamic> data}) async {
    emit(ResetPasswordLoading());
    try {
      ApiResponse apiResponse = ApiResponse.fromJson(
          await ApiService.post(data: data, path: '/resetPassword'));
      ResetPasswordResponse resetPasswordResponse =
          ResetPasswordResponse.fromJson(apiResponse.data!);
      emit(ResetPasswordSuccess(resetPasswordResponse));
    } on String catch (e) {
      emit(ResetPasswordFailed(e));
    } catch (e) {
      emit(ResetPasswordFailed('An error has occured'));
    }
  }
}
