import 'package:cloudwalk_location/src/app/shared/network/http_client.dart';

import '../entity/position_entity.dart';

abstract class IpApiDatasource {
  Future<PositionEntity> getPosition();
}

class IpApiDatasourceImpl implements IpApiDatasource {
  final HttpClient _httpClient;

  IpApiDatasourceImpl(this._httpClient);

  @override
  Future<PositionEntity> getPosition() async {
    final response = await _httpClient.dio
        .get('http://ip-api.com/json/?fields=status,message,lat,lon');

    return PositionEntity.fromJson(response.data);
  }
}
