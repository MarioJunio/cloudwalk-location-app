// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PositionEntityImpl _$$PositionEntityImplFromJson(Map<String, dynamic> json) =>
    _$PositionEntityImpl(
      status: $enumDecode(_$PositionStatusEnumMap, json['status']),
      message: json['message'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PositionEntityImplToJson(
        _$PositionEntityImpl instance) =>
    <String, dynamic>{
      'status': _$PositionStatusEnumMap[instance.status]!,
      'message': instance.message,
      'lat': instance.lat,
      'lon': instance.lon,
    };

const _$PositionStatusEnumMap = {
  PositionStatus.success: 'success',
  PositionStatus.fail: 'fail',
};
