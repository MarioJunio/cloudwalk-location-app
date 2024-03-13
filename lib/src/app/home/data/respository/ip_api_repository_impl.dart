// ignore_for_file: implementation_imports

import 'package:cloudwalk_location/src/app/home/data/entity/position_entity.dart';
import 'package:cloudwalk_location/src/app/home/data/datasource/ip_api_datasource.dart';
import 'package:cloudwalk_location/src/app/home/domain/model/error_message_model.dart';
import 'package:cloudwalk_location/src/app/home/domain/model/position_model.dart';
import 'package:cloudwalk_location/src/app/home/domain/repository/ip_api_repository.dart';
import 'package:dart_either/src/dart_either.dart';

class IpApiRepositoryImpl implements IpApiRepository {
  final IpApiDatasource _ipApiDatasource;

  IpApiRepositoryImpl(this._ipApiDatasource);

  @override
  Future<Either<ErrorMessageModel, PositionModel>> getPosition() async {
    try {
      final PositionEntity entity = await _ipApiDatasource.getPosition();

      return entity.status == PositionStatus.success
          ? Right(PositionModel.fromEntity(entity))
          : Left(
              ErrorMessageModel(
                  message: entity.message ??
                      'Não foi possível buscar a localização'),
            );
    } catch (e) {
      return Left(
        ErrorMessageModel(
            message: 'Houve um erro ao tentar buscar a localização'),
      );
    }
  }
}
