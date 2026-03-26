import 'package:json_annotation/json_annotation.dart';

enum QuestionTypes {
  @JsonValue('single_choice')
  singleChoice(isMulti: false),

  @JsonValue('multi_choice') // لو الـ API بعت دي هيحولها لـ Enum أوتوماتيك
  multiChoice(isMulti: true);

  final bool isMulti;
  const QuestionTypes({required this.isMulti});
}
