import 'package:exam_app_elevate/config/caching/hive_keys.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/home/questions/data/model/question_adaptor.dart';

@module
abstract class HiveModule {
  @preResolve
  Future<Box> openBox() async {
    // شلنا الـ T والـ Box بقى dynamic
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    // سطر الحياة هنا:
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(QuestionsResponseAdapter());
    }
    return await Hive.openBox(HiveKeys.boxName);
  }
}
