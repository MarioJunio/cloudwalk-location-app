import 'package:cloudwalk_location/src/app/shared/network/http_client.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../app_di.dart';
import 'network/interceptors/cache_interceptor.dart';
import 'services/check_internet_service.dart';
import 'services/geolocator_service.dart';

class SharedDi implements Di {
  @override
  void setupBinds() {
    GetIt.I.registerLazySingleton(
      () => HttpClient(
        Dio(),
        interceptors: [
          CacheInterceptor(
            GetIt.I.get(),
            GetIt.I.get(),
          )
        ],
      ),
    );

    GetIt.I.registerLazySingleton<GeolocatorService>(
      () => GeolocatorServiceImpl(),
    );

    GetIt.I.registerLazySingleton<CheckInternetService>(
      () => CheckInternetServiceImpl(),
    );
  }
}
