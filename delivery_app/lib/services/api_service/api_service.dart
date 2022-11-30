import 'package:delivery_app/cubits/authentication/customer_token.dart';
import 'package:delivery_app/models/api_response/api_response.dart';
import 'package:delivery_app/utilities/rest_client/rest_client.dart';
import 'package:delivery_app/utilities/rest_client/rest_client_customer.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class ApiService {
  ///Retrieves the [RestClient] from the service locator
  static RestClient restClient = GetIt.I<RestClient>();
  static RestClientCustomer restClientCustomer = GetIt.I<RestClientCustomer>();

  ///This method posts data to the API via the [Dio] in the [restClient]
  ///Returns a dynamic
  static Future<dynamic> post(
      {required data,
      required String path,
      Options? options,
      Map? queryParameters}) async {
    try {
      ///Get the response after posting
      var response = await restClient.dio!
          .post('${restClient.baseURL}$path', data: data, options: options);
      return response.data;
    }

    /// Throw the dio error
    on DioError catch (e) {
      ApiResponse apiResponse = ApiResponse.fromJson(e.response!.data);
      throw apiResponse.message!;
    }
  }

  static Future<Map<String, dynamic>> postData({
    required Map<String, dynamic> data,
    required String path,
  }) async {
    try {
      var response =
          await restClient.dio!.post('${restClient.customerURL}$path',
              data: data,
              options: Options(headers: {
                'Content-Type':
                    'application/x-www-form-urlencoded; charset=UTF-8',
                'X-user': 'customer',
              }));
      return response.data;
    } on DioError catch (error) {
      try {
        throw error.response!.data['message'][0]['body'];
      } catch (e) {
        throw error.message;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Map<String, dynamic>> postDataMpesa({
    required Map<String, dynamic> data,
    required String path,
  }) async {
    try {
      var response =
          await restClientCustomer.dio!.post('${restClient.customerURL}$path',
              data: data,
              options: Options(headers: {
                'Content-Type':
                    'application/x-www-form-urlencoded; charset=UTF-8',
                'X-User': 'customer',
                'Authorization':
                    'Bearer ${GetIt.I<CustomerTokenCubit>().state}',
              }));
      return response.data;
    } on DioError catch (error) {
      try {
        throw error.response!.data['message'][0]['body'];
      } catch (e) {
        throw error.message;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  ///This method gets data from the API via the [Dio] in the [restClient]
  ///Returns a dynamic based on the API Response
  static Future<dynamic> get(
      {required String path,
      Options? options,
      required Map queryParameters}) async {
    try {
      ///Get the response after posting
      var response = await restClient.dio!
          .get('${restClient.baseURL}$path', options: options);
      return response.data;
    }

    /// Throw the dio error
    on DioError catch (e) {
      ApiResponse apiResponse = ApiResponse.fromJson(e.response!.data);
      throw apiResponse.message!;
    }
  }

  static getData({required String path}) {}
}
