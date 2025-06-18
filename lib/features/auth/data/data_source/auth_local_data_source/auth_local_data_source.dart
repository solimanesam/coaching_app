import 'package:coaching_app/core/constants/cache_constant.dart';
import 'package:coaching_app/core/services/cache_service.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheToken(String token);
  Future<String?> getToken();

  Future<void> cacheRole(String role);
  Future<String?> getRole();

  Future<void> clearAuthData();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final BaseCache cache;

  

  AuthLocalDataSourceImpl({required this.cache});

  @override
  Future<void> cacheToken(String token) async {
    await cache.insertStringToCache(key: CacheConstant.tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await cache.getStringFromCache(key: CacheConstant.tokenKey);
  }

  @override
  Future<void> cacheRole(String role) async {
    await cache.insertStringToCache(key: CacheConstant.roleKey, value: role);
  }

  @override
  Future<String?> getRole() async {
    return await cache.getStringFromCache(key: CacheConstant.roleKey);
  }

  @override
  Future<void> clearAuthData() async {
    await cache.deleteCache(key: CacheConstant.tokenKey);
    await cache.deleteCache(key: CacheConstant.roleKey);
  }
}
