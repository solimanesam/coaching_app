import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class BaseCache {
  Future<void> cacheInitialization();

  Future<bool> insertStringToCache({required String key, required String value});
  Future<String?> getStringFromCache({required String key});

  Future<bool> insertIntToCache({required String key, required int value});
  Future<int?> getIntFromCache({required String key});

  Future<bool> insertBoolToCache({required String key, required bool value});
  Future<bool?> getBoolFromCache({required String key});

  Future<bool> insertDoubleToCache({required String key, required double value});
  Future<double?> getDoubleFromCache({required String key});

  Future<bool> deleteCache({required String key});
}

class CacheImplBySecureStorage extends BaseCache {
  late final FlutterSecureStorage secureStorage;

  @override
  Future<void> cacheInitialization() async {
    secureStorage = const FlutterSecureStorage();
  }

  @override
  Future<bool> insertStringToCache({required String key, required String value}) async {
    try {
      await secureStorage.write(key: key, value: value);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<String?> getStringFromCache({required String key}) async {
    return await secureStorage.read(key: key);
  }

  @override
  Future<bool> insertIntToCache({required String key, required int value}) async {
    return await insertStringToCache(key: key, value: value.toString());
  }

  @override
  Future<int?> getIntFromCache({required String key}) async {
    final value = await secureStorage.read(key: key);
    return value != null ? int.tryParse(value) : null;
  }

  @override
  Future<bool> insertBoolToCache({required String key, required bool value}) async {
    return await insertStringToCache(key: key, value: value.toString());
  }

  @override
  Future<bool?> getBoolFromCache({required String key}) async {
    final value = await secureStorage.read(key: key);
    return value != null ? value.toLowerCase() == 'true' : null;
  }

  @override
  Future<bool> insertDoubleToCache({required String key, required double value}) async {
    return await insertStringToCache(key: key, value: value.toString());
  }

  @override
  Future<double?> getDoubleFromCache({required String key}) async {
    final value = await secureStorage.read(key: key);
    return value != null ? double.tryParse(value) : null;
  }

  @override
  Future<bool> deleteCache({required String key}) async {
    try {
      await secureStorage.delete(key: key);
      return true;
    } catch (_) {
      return false;
    }
  }
}
