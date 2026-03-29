import 'package:exam_app_elevate/features/home/questions/data/model/questions_response.dart';
import 'package:hive/hive.dart';

class QuestionsResponseAdapter extends TypeAdapter<QuestionsResponse> {
  @override
  final int typeId = 0; // اختاري أي رقم فريد

  @override
  QuestionsResponse read(BinaryReader reader) {
    // استخدمي الـ fromJson عشان ترجعي الأوبجكت
    final map = reader.readMap();
    return QuestionsResponse.fromJson(Map<String, dynamic>.from(map));
  }

  @override
  void write(BinaryWriter writer, QuestionsResponse obj) {
    // خزن الـ toJson في ملفات الـ Hive
    writer.writeMap(obj.toJson());
  }
}
