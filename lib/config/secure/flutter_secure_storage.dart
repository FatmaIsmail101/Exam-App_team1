import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CashingFlutterSecureStorage {
  static late FlutterSecureStorage storage;

  static Future<void> init() async {
    storage = FlutterSecureStorage();
  }

  static Future<void> save(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  static Future<String?> get(String key) async {
    return await storage.read(key: key);
  }
}
