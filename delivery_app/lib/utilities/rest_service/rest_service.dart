import 'package:delivery_app/cubits/authentication/customer_token.dart';
import 'package:delivery_app/models/api_response/api_response.dart';
import 'package:delivery_app/models/customer_token_model.dart';
import 'package:delivery_app/utilities/rest_client/rest_client.dart';
import 'package:delivery_app/utilities/rest_client/rest_client_customer.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  static RestClient restClient = GetIt.I<RestClient>();

  static RestClientCustomer restClientCustomer = GetIt.I<RestClientCustomer>();

  getData({required String path, Map<String, dynamic>? queries}) async {
    Dio dio = Dio();
    RestClient restClient = RestClient();
    CustomerTokenModel customerTokenModel = GetIt.I<CustomerTokenModel>();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));
    try {
      var response = await dio.get('${restClient.customerURL}$path',
          queryParameters: queries,
          options: Options(headers: {
            'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
            'X-User': 'customer',
            'Authorization': 'Bearer ${customerTokenModel.token}',
            'Cookie': 'PHPSESSID=${customerTokenModel.cookie}'
          }));
      return response.data;
    } on DioError catch (e) {
      throw e.message;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> postCustomer(
      {required data,
      required String path,
      Options? options,
      Map? queryParameters}) async {
    try {
      ///Get the response after posting
      var response =
          await restClient.dio!.post('${restClient.customerURL}$path',
              data: data,
              options: Options(headers: {
                'X-user': 'customer',
                'Content-Type':
                    'application/x-www-form-urlencoded; charset=UTF-8',
              }));
      return response.data;
    }

    /// Throw the dio error
    on DioError catch (e) {
      ApiResponse apiResponse = ApiResponse.fromJson(e.response!.data);
      throw apiResponse.message!;
    }
  }

  Future<dynamic> getDataWithCustomerAuth(
      {required String path,
      Options? options,
      Map<String, dynamic>? queries}) async {
    CustomerTokenModel customerTokenModel = GetIt.I<CustomerTokenModel>();
    try {
      var response =
          await restClientCustomer.dio!.get('${restClient.customerURL}$path',
              options: Options(headers: {
                'Content-Type':
                    'application/x-www-form-urlencoded; charset=UTF-8',
                'X-user': 'customer',
                'Connection': 'keep-alive',
                'Accept-encoding': 'gzip, deflate, br',
                'Accept': '*/*',
                'User-Agent': 'PostmanRuntime/7.29.2',
                'Authorization':
                    'Bearer ${GetIt.I<CustomerTokenCubit>().state}',
                'Cookie': 'PHPSESSID=${customerTokenModel.cookie}'
              }),
              queryParameters: queries);
      return response.data;
    } on DioError catch (error) {
      throw error.message;
    } catch (e) {
      throw e.toString();
    }
  }
}
