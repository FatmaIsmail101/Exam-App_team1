import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CachingHelper {
  final Box _box; // الـ Box نفسه بيبقى dynamic داخلياً

  CachingHelper(this._box);

  // هنا بنستخدم T عشان نضمن إن الداتا اللي راجعة هي اللي إحنا عايزينها
  Future<void> saveData<T>(String key, T value) async {
    await _box.put(key, value);
  }

  T? getData<T>(String key) {
    return _box.get(key) as T?;
  }

  Future<void> deleteData(String key) async {
    await _box.delete(key);
  }
}
