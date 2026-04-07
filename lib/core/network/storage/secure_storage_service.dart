import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../values/secure_storage_keys.dart';
@lazySingleton
class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService(this._storage);

  Future<void> writeToken(String token) =>
      _storage.write(key: SecureStorageKeys.token, value: token);

  Future<String?> readToken() =>
      _storage.read(key: SecureStorageKeys.token);

  Future<void> deleteToken() =>
      _storage.delete(key: SecureStorageKeys.token);

  Future<void> writeRememberMe(bool value) =>
      _storage.write(key: SecureStorageKeys.rememberMe, value: value.toString());

  Future<bool> readRememberMe() async {
    final value = await _storage.read(key: SecureStorageKeys.rememberMe);
    return value == 'true';
  }
}