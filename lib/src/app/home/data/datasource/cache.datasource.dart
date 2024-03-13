import 'dart:async';

import 'package:hive/hive.dart';

abstract class CacheDatasource {
  static const String boxName = "cache";

  Future<void> put(String key, dynamic value);

  Future<dynamic> get(String key);
}

class CacheDatasourceImpl implements CacheDatasource {
  @override
  Future<void> put(String key, dynamic value) async {
    final box = await Hive.openBox(CacheDatasource.boxName);

    await box.put(key, value);
  }

  @override
  Future<dynamic> get(String key) async {
    final box = await Hive.openBox(CacheDatasource.boxName);

    return await box.get(key);
  }
}
