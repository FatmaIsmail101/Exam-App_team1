import 'package:shared_preferences/shared_preferences.dart';

import '../di/di.dart';

class CachingHelper {
  static Future<void> saveString(String key, String value) async {
    await getIt.get<SharedPreferences>().setString(key, value);
  }

  static String? getString(String key) {
    return getIt.get<SharedPreferences>().getString(key);
  }
}
