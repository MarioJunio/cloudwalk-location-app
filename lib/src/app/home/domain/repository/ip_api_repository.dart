import 'package:cloudwalk_location/src/app/home/domain/model/error_message_model.dart';
import 'package:cloudwalk_location/src/app/home/domain/model/position_model.dart';
import 'package:dart_either/dart_either.dart';

abstract class IpApiRepository {
  Future<Either<ErrorMessageModel, PositionModel>> getPosition();
}