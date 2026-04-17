import 'package:json_annotation/json_annotation.dart';

part 'exam_response.g.dart';

@JsonSerializable()
class ExamResponse {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'subject')
  String? subject;
  @JsonKey(name: 'duration')
  int? duration;
  @JsonKey(name: 'numberOfQuestions')
  int? numberOfQuestions;
  @JsonKey(name: 'active')
  bool? active;
  @JsonKey(name: 'createdAt')
  String? createdAt;

  ExamResponse({
    this.id,
    this.title,
    this.subject,
    this.duration,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  Map<String, dynamic> toJson() => _$ExamResponseToJson(this);

  factory ExamResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamResponseFromJson(json);
}
