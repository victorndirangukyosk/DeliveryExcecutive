import 'package:hydrated_bloc/hydrated_bloc.dart';

class CustomerTokenCubit extends Cubit<String> {
  CustomerTokenCubit(String state) : super(state);

  var token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJpYXQiOjE2MzM3OTQzNzMsImp0aSI6ImpUTWlcL1p4NmloOVM1RVZTWHBrcXVlTGY0RnA0WCtBM1dLZjdiSkZoRGxRPSIsImlzcyI6InNlcnZlck5hbWUiLCJuYmYiOjE2MzM3OTQzNzMsImV4cCI6MTYzNDM5OTE3MywiZGF0YSI6eyJpZCI6IjM5NiIsIm5hbWUiOiJ0aGNwOTYxQGdtYWlsLmNvbSJ9fQ.YM26eeVym5IqC4MeWDip_eFbWc9aVF_pJTRJunrR6TN9giGuriKHrW85FpBnJNNOoxT3Nkjay_gnahDbk5hSuw';

  saveToken(String token) {
    emit(token);
  }
}
