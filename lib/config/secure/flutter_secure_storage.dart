import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/values/app_keys.dart';

class CashingFlutterSecureStorage {
  static late FlutterSecureStorage storage;

  static Future<void> init() async {
    storage = FlutterSecureStorage();
  }

  static Future<void> saveToken(String token, String value) async {
    await storage.write(key: AppKeys.token, value: value);
  }

  static Future<String?> getToken(String key) async {
    return await storage.read(key: key);
  }
}
