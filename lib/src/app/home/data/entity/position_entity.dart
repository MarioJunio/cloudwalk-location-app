import 'package:freezed_annotation/freezed_annotation.dart';

part 'position_entity.freezed.dart';
part 'position_entity.g.dart';

@freezed
class PositionEntity with _$PositionEntity {
  factory PositionEntity({
    required PositionStatus status,
    String? message,
    double? lat,
    double? lon,
  }) = _PositionEntity;

  factory PositionEntity.fromJson(Map<String, dynamic> json) =>
      _$PositionEntityFromJson(json);
}

enum PositionStatus {
  success,
  fail,
}
