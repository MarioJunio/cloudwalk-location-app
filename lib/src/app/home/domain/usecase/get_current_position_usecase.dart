import 'package:cloudwalk_location/src/app/home/domain/repository/ip_api_repository.dart';
import 'package:dart_either/dart_either.dart';

import '../../../shared/services/geolocator_service.dart';
import '../model/error_message_model.dart';
import '../model/position_model.dart';

abstract class GetCurrentPositionUsecase {
  Future<Either<ErrorMessageModel, PositionModel>> call();
}

class GetCurrentPositionUsecaseImpl implements GetCurrentPositionUsecase {
  final IpApiRepository _apiRepository;
  final GeolocatorService _geolocatorService;

  GetCurrentPositionUsecaseImpl(
    this._apiRepository,
    this._geolocatorService,
  );

  @override
  Future<Either<ErrorMessageModel, PositionModel>> call() async {
    final bool locationEnabled =
        await _geolocatorService.isLocationServiceEnabled();

    if (locationEnabled) {
      return await _getPositionFromGps();
    } else {
      return await _getPositionFromNetwork();
    }
  }

  Future<Either<ErrorMessageModel, PositionModel>> _getPositionFromGps() async {
    try {
      final position = await _geolocatorService.getCurrentPosition();

      return Right(position);
    } catch (error) {
      await _geolocatorService.openLocationSettingsUi();
      return Left(
        ErrorMessageModel(message: error.toString()),
      );
    }
  }

  Future<Either<ErrorMessageModel, PositionModel>>
      _getPositionFromNetwork() async {
    return await _apiRepository.getPosition();
  }
}
