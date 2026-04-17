import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class SharedPrefModule {
  @preResolve // السطر ده هو الحل
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
