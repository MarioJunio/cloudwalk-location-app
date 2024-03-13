// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ErrorMessageModel {
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ErrorMessageModelCopyWith<ErrorMessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorMessageModelCopyWith<$Res> {
  factory $ErrorMessageModelCopyWith(
          ErrorMessageModel value, $Res Function(ErrorMessageModel) then) =
      _$ErrorMessageModelCopyWithImpl<$Res, ErrorMessageModel>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ErrorMessageModelCopyWithImpl<$Res, $Val extends ErrorMessageModel>
    implements $ErrorMessageModelCopyWith<$Res> {
  _$ErrorMessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorMessageModelImplCopyWith<$Res>
    implements $ErrorMessageModelCopyWith<$Res> {
  factory _$$ErrorMessageModelImplCopyWith(_$ErrorMessageModelImpl value,
          $Res Function(_$ErrorMessageModelImpl) then) =
      __$$ErrorMessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorMessageModelImplCopyWithImpl<$Res>
    extends _$ErrorMessageModelCopyWithImpl<$Res, _$ErrorMessageModelImpl>
    implements _$$ErrorMessageModelImplCopyWith<$Res> {
  __$$ErrorMessageModelImplCopyWithImpl(_$ErrorMessageModelImpl _value,
      $Res Function(_$ErrorMessageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorMessageModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorMessageModelImpl implements _ErrorMessageModel {
  _$ErrorMessageModelImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ErrorMessageModel(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorMessageModelImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorMessageModelImplCopyWith<_$ErrorMessageModelImpl> get copyWith =>
      __$$ErrorMessageModelImplCopyWithImpl<_$ErrorMessageModelImpl>(
          this, _$identity);
}

abstract class _ErrorMessageModel implements ErrorMessageModel {
  factory _ErrorMessageModel({required final String message}) =
      _$ErrorMessageModelImpl;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ErrorMessageModelImplCopyWith<_$ErrorMessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
