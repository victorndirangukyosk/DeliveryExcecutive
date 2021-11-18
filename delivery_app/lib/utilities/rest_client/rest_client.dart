import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RestClient {
  Dio? _dio;

  Dio? get dio => _dio;

  String baseURL = '';

  RestClient({BaseOptions? options}) {
    create(options);
  }

  void create([BaseOptions? options]) {
    _dio = Dio(options);

    ///Add the interceptors
    if (kDebugMode) {
      _dio!.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90));
    }
  }
}
