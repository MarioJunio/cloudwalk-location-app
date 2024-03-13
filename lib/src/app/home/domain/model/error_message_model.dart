import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_message_model.freezed.dart';

@freezed
class ErrorMessageModel with _$ErrorMessageModel {
  factory ErrorMessageModel({
    required String message,
  }) = _ErrorMessageModel;
}
