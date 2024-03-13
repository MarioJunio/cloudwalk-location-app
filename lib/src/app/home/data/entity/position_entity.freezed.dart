// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'position_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PositionEntity _$PositionEntityFromJson(Map<String, dynamic> json) {
  return _PositionEntity.fromJson(json);
}

/// @nodoc
mixin _$PositionEntity {
  PositionStatus get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PositionEntityCopyWith<PositionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionEntityCopyWith<$Res> {
  factory $PositionEntityCopyWith(
          PositionEntity value, $Res Function(PositionEntity) then) =
      _$PositionEntityCopyWithImpl<$Res, PositionEntity>;
  @useResult
  $Res call({PositionStatus status, String? message, double? lat, double? lon});
}

/// @nodoc
class _$PositionEntityCopyWithImpl<$Res, $Val extends PositionEntity>
    implements $PositionEntityCopyWith<$Res> {
  _$PositionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PositionStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PositionEntityImplCopyWith<$Res>
    implements $PositionEntityCopyWith<$Res> {
  factory _$$PositionEntityImplCopyWith(_$PositionEntityImpl value,
          $Res Function(_$PositionEntityImpl) then) =
      __$$PositionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PositionStatus status, String? message, double? lat, double? lon});
}

/// @nodoc
class __$$PositionEntityImplCopyWithImpl<$Res>
    extends _$PositionEntityCopyWithImpl<$Res, _$PositionEntityImpl>
    implements _$$PositionEntityImplCopyWith<$Res> {
  __$$PositionEntityImplCopyWithImpl(
      _$PositionEntityImpl _value, $Res Function(_$PositionEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_$PositionEntityImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PositionStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PositionEntityImpl implements _PositionEntity {
  _$PositionEntityImpl(
      {required this.status, this.message, this.lat, this.lon});

  factory _$PositionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PositionEntityImplFromJson(json);

  @override
  final PositionStatus status;
  @override
  final String? message;
  @override
  final double? lat;
  @override
  final double? lon;

  @override
  String toString() {
    return 'PositionEntity(status: $status, message: $message, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PositionEntityImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, lat, lon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PositionEntityImplCopyWith<_$PositionEntityImpl> get copyWith =>
      __$$PositionEntityImplCopyWithImpl<_$PositionEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PositionEntityImplToJson(
      this,
    );
  }
}

abstract class _PositionEntity implements PositionEntity {
  factory _PositionEntity(
      {required final PositionStatus status,
      final String? message,
      final double? lat,
      final double? lon}) = _$PositionEntityImpl;

  factory _PositionEntity.fromJson(Map<String, dynamic> json) =
      _$PositionEntityImpl.fromJson;

  @override
  PositionStatus get status;
  @override
  String? get message;
  @override
  double? get lat;
  @override
  double? get lon;
  @override
  @JsonKey(ignore: true)
  _$$PositionEntityImplCopyWith<_$PositionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
