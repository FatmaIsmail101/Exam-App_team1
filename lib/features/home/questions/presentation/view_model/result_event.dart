sealed class ResultEvent {}

class ShowResultEvent extends ResultEvent {
  final Map<int, String> answers; // إضافة الخريطة هنا
  ShowResultEvent(this.answers);
}
