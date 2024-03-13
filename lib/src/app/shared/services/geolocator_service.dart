import 'package:cloudwalk_location/src/app/home/domain/model/position_model.dart';
import 'package:geolocator/geolocator.dart';

abstract class GeolocatorService {
  Future<bool> isLocationServiceEnabled();

  Future<PositionModel> getCurrentPosition();

  Future<bool> openLocationSettingsUi();
}

class GeolocatorServiceImpl implements GeolocatorService {
  @override
  Future<PositionModel> getCurrentPosition() async {
    var permission = await Geolocator.checkPermission();

    while (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.deniedForever) {
        return Future.error('Permissão de acesso negada');
      }
    }

    return PositionModel.fromPosition(await Geolocator.getCurrentPosition());
  }

  @override
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<bool> openLocationSettingsUi() async {
    return await Geolocator.openLocationSettings();
  }
}
