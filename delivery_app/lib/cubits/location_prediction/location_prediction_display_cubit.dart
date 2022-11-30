import 'package:bloc/bloc.dart';
import 'package:delivery_app/models/prediction/place_prediction.dart';
import 'package:delivery_app/models/prediction/place_predictions_response.dart';
import 'package:delivery_app/user_interfaces/delivery/directions_to_address/components/api_secret.dart';
import 'package:delivery_app/utilities/rest_client/rest_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_prediction_display_state.dart';
part 'location_prediction_display_cubit.freezed.dart';

class LocationPredictionDisplayCubit
    extends Cubit<LocationPredictionDisplayState> {
  LocationPredictionDisplayCubit()
      : super(LocationPredictionDisplayState.initial());

  showPlacePredictions(String placeName) async {
    emit(const LocationPredictionDisplayState.loading());
    try {
      String autoCompleteUrl =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=${Secrets.API_KEY}&components=country:ke';
      var response = await RestClient().dio!.get(autoCompleteUrl);
      // PlacePredictionsResponse placePredictionsResponse =
      //     PlacePredictionsResponse.fromJson(response.data);
      List placePredictionResponseinJson = response.data['predictions'];
      List<PlacePrediction> predictions = List.generate(
          placePredictionResponseinJson.length,
          ((index) => PlacePrediction.fromJson(placePredictionResponseinJson[index])));
      emit(LocationPredictionDisplayState.success(predictions));
    } catch (e) {
      emit(LocationPredictionDisplayState.failed(e.toString()));
    }
  }
}
