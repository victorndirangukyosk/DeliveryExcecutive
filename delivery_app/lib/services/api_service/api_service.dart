import 'package:delivery_app/utilities/rest_client/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ApiService {
  ///Retrieves the [RestClient] from the service locator
  static RestClient restClient = GetIt.I<RestClient>();

  ///This method posts data to the API via the [Dio] in the [restClient]
  ///Returns a dynamic
  static Future<dynamic> post(
      {required Map<String, dynamic> data,
      required String path,
      Options? options}) async {
    try {
      ///Get the response after posting
      var response = await restClient.dio!
          .post("${restClient.baseURL}$path", data: data, options: options);
      return response.data;
    }

    /// Throw the dio error
    on DioError catch (e) {
      print(e.message);
      rethrow;
    }
  }

  ///This method gets data to the API via the [Dio] in the [restClient]
  ///Returns a dynamic based on the API Response
  static Future<dynamic> get({required String path, Options? options}) async {
    try {
      ///Get the response after posting
      var response = await restClient.dio!
          .get("${restClient.baseURL}$path", options: options);
      return response.data;
    }

    /// Throw the dio error
    on DioError catch (e) {
      print(e.message);
      rethrow;
    }
  }
}
