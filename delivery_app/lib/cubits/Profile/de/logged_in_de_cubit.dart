import 'package:bloc/bloc.dart';
import 'package:delivery_app/models/Profile/de/logged_in_de.dart';
import 'package:delivery_app/utilities/rest_client/rest_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logged_in_de_state.dart';
part 'logged_in_de_cubit.freezed.dart';

class LoggedInDeCubit extends Cubit<LoggedInDeState> {
  LoggedInDeCubit() : super(LoggedInDeState.initial());
   getLoggedDeProfile() async {
    emit(const LoggedInDeState.loading());
    try {
      var response = await RestClient().dio!.get(
            'https://stage.apiadmin.kwikbasket.com/api/deliveryexecutive/profile',
           
          );
      List ordersinJson = response.data['data'];
      List<LoggedInDe> loggedinde = List.generate(ordersinJson.length,
          ((index) => LoggedInDe.fromJson(ordersinJson[index])));

     

      emit(LoggedInDeState.success(loggedinde));
    } catch (e) {
      emit(LoggedInDeState.error(e.toString()));
    }
  }
}
