import 'package:exam_app_elevate/features/home/commen_response/exam_response.dart';
import 'package:exam_app_elevate/features/home/questions/data/model/question_types.dart';
import 'package:json_annotation/json_annotation.dart';

import 'answers_list_response.dart';

part 'questions_list_response.g.dart';

@JsonSerializable()
class QuestionsListResponse {
  @JsonKey(name: 'answers')
  List<AnswersListResponse>? answersListResponse;
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'type')
  QuestionTypes? type;
  @JsonKey(name: 'question')
  String? question;
  @JsonKey(name: "correct")
  String? correct;
  @JsonKey(name: "exam")
  ExamResponse? examResponse;
  @JsonKey(name: "subject")
  String? subject;
  @JsonKey(name: 'createdAt')
  String? createdAt;
  QuestionsListResponse({
    this.answersListResponse,
    this.id,
    this.type,
    this.question,
    this.correct,
    this.examResponse,
    this.subject,
    this.createdAt,
  });

  factory QuestionsListResponse.fromJson(Map<String, dynamic> json) {
    return _$QuestionsListResponseFromJson(json);
  }
  Map<String, dynamic> toJson() => _$QuestionsListResponseToJson(this);
}
