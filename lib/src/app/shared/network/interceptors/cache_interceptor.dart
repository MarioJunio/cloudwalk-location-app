import 'dart:convert';

import 'package:cloudwalk_location/src/app/home/domain/repository/cache_repository.dart';
import 'package:cloudwalk_location/src/app/home/domain/usecase/check_internet_connection.usecase.dart';
import 'package:dio/dio.dart';

class CacheInterceptor extends InterceptorsWrapper {
  final CacheRepository _cacheRepository;

  final CheckInternetConnectionUsecase _checkInternetConnectionUsecase;

  CacheInterceptor(
    this._checkInternetConnectionUsecase,
    this._cacheRepository,
  );

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final hasInternetConnection = await _checkInternetConnectionUsecase();

    if (!hasInternetConnection) {
      await _handleGetRequest(handler, options);
    } else {
      handler.next(options);
    }
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    final id =
        '${response.requestOptions.method}:${response.requestOptions.path}';

    if (response.requestOptions.method == 'GET') {
      await _cacheRepository.put(id, json.encode(response.data));
    }

    handler.next(response);
  }

  _handleGetRequest(
    RequestInterceptorHandler handler,
    RequestOptions options,
  ) async {
    if (options.method == "GET") {
      final id = '${options.method}:${options.path}';

      final dataCached = await _cacheRepository.get(id);

      handler.resolve(
        Response(
          data: json.decode(dataCached),
          extra: options.extra,
          statusCode: 200,
          requestOptions: options,
        ),
        true,
      );
    }
  }
}
