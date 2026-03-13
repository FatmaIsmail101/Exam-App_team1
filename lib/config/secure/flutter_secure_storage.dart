import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/values/app_keys.dart';

class CashingFlutterSecureStorage {
  static late FlutterSecureStorage storage;

  static Future<void> init() async {
    storage = FlutterSecureStorage();
  }

  static Future<void> saveToken(String token) async {
    await storage.write(key: AppKeys.token, value: token);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: AppKeys.token);
  }
}
