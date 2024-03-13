abstract class CacheRepository {
  Future<void> put(String key, dynamic value);
  Future get(String key);
}
