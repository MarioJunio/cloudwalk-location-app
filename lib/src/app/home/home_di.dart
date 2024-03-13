import 'package:cloudwalk_location/src/app/app_di.dart';
import 'package:cloudwalk_location/src/app/home/data/datasource/cache.datasource.dart';
import 'package:cloudwalk_location/src/app/home/data/datasource/ip_api_datasource.dart';
import 'package:cloudwalk_location/src/app/home/data/respository/cache_repository_impl.dart';
import 'package:cloudwalk_location/src/app/home/domain/repository/cache_repository.dart';
import 'package:cloudwalk_location/src/app/home/domain/repository/ip_api_repository.dart';
import 'package:cloudwalk_location/src/app/home/domain/usecase/get_current_position_usecase.dart';
import 'package:cloudwalk_location/src/app/home/presentation/home_controller.dart';
import 'package:get_it/get_it.dart';

import 'data/respository/ip_api_repository_impl.dart';
import 'domain/usecase/check_internet_connection.usecase.dart';

class HomeDi implements Di {
  @override
  void setupBinds() {
    GetIt.I.registerLazySingleton<IpApiDatasource>(
      () => IpApiDatasourceImpl(GetIt.I.get()),
    );

    GetIt.I.registerLazySingleton<CacheDatasource>(
      () => CacheDatasourceImpl(),
    );

    GetIt.I.registerLazySingleton<IpApiRepository>(
      () => IpApiRepositoryImpl(GetIt.I.get()),
    );

    GetIt.I.registerLazySingleton<CacheRepository>(
      () => CacheRepositoryImpl(GetIt.I.get()),
    );

    GetIt.I.registerLazySingleton<GetCurrentPositionUsecase>(
      () => GetCurrentPositionUsecaseImpl(
        GetIt.I.get(),
        GetIt.I.get(),
      ),
    );

    GetIt.I.registerLazySingleton<CheckInternetConnectionUsecase>(
      () => CheckInternetConnectionUsecaseImpl(
        GetIt.I.get(),
      ),
    );

    GetIt.I.registerLazySingleton(
      () => HomeController(GetIt.I.get()),
    );
  }
}
