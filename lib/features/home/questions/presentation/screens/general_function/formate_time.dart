class FormateTime {
  static String formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    // الـ padLeft(2, '0') بتضمن إن الرقم لو 5 يظهر 05
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }
}
