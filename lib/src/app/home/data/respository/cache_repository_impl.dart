import 'package:cloudwalk_location/src/app/home/data/datasource/cache.datasource.dart';
import 'package:cloudwalk_location/src/app/home/domain/repository/cache_repository.dart';

class CacheRepositoryImpl implements CacheRepository {
  final CacheDatasource _cacheDatasource;

  CacheRepositoryImpl(this._cacheDatasource);

  @override
  Future get(String key) async {
    return await _cacheDatasource.get(key);
  }

  @override
  Future<void> put(String key, value) async {
    await _cacheDatasource.put(key, value);
  }
}
