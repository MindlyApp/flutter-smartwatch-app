import 'package:dio/dio.dart';

/// This method creates and returns the DIO client for HTTP.
Dio buildDioClient(String _baseUrl) {
  final dio = Dio()..options = BaseOptions(baseUrl: _baseUrl);

  dio.interceptors.addAll(
    [
      /*TokenInterceptor(),
      DioLogInterceptor(logger: logger),
      LoggyDioInterceptor()*/
    ]
  );

  return dio;
}