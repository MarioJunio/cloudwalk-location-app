import 'package:cloudwalk_location/src/app/home/data/entity/position_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'position_model.freezed.dart';

@freezed
class PositionModel with _$PositionModel {
  factory PositionModel({
    required double lat,
    required double lon,
  }) = _PositionModel;

  factory PositionModel.fromEntity(PositionEntity entity) =>
      PositionModel(lat: entity.lat!, lon: entity.lon!);

  factory PositionModel.fromPosition(Position position) =>
      PositionModel(lat: position.latitude, lon: position.longitude);
}
