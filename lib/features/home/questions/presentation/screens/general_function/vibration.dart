import 'package:vibration/vibration.dart';

class VibrationFunctions {
  static void triggerVibration() async {
    // التأكد أولاً إذا كان الجهاز يدعم الاهتزاز
    if (await Vibration.hasVibrator() ?? false) {
      // اهتزاز لمدة ثانية واحدة (1000 مللي ثانية)
      Vibration.vibrate(duration: 1000);

      // أو لو عايزة نمط معين (اهتزاز، توقف، اهتزاز)
      // Vibration.vibrate(pattern: [500, 200, 500]);
    }
  }
}
