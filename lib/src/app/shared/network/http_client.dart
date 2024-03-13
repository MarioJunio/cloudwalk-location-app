import 'package:dio/dio.dart';

class HttpClient {
  final Dio _dio;

  HttpClient(
    this._dio, {
    List<Interceptor>? interceptors,
  }) {
    if (interceptors != null) {
      _dio.interceptors.addAll(interceptors);
    }
  }

  Dio get dio => _dio;
}
