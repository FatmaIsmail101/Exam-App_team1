import 'package:exam_app_elevate/features/home/common_response/exam_response.dart';
import 'package:exam_app_elevate/main.dart';
import 'package:json_annotation/json_annotation.dart';

import 'answers_list_response.dart';

part 'questions_list_response.g.dart';

@JsonSerializable()
class QuestionsListResponse {
  @JsonKey(name: 'answers', fromJson: _answersFromJson)
  List<AnswersListResponse>? answersListResponse;
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'type')
  String? type;
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

  // 2. الدالة دي هتضمن إن الداتا لو جات String تتحول لـ List أو ترجع فاضية بدل ما تضرب
  static List<AnswersListResponse>? _answersFromJson(Object? json) {
    if (json == null) return null;

    // لو الداتا فعلاً قائمة (وهو الطبيعي)
    if (json is List) {
      return json
          .map((e) => AnswersListResponse.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    // لو السيرفر بعت String (سبب المشكلة)
    if (json is String) {
      // هنا ممكن تعمل log إن في مشكلة في السؤال ده
      return [];
    }

    return null;
  }

  factory QuestionsListResponse.fromJson(Map<String, dynamic> json) {
    try {
      return _$QuestionsListResponseFromJson(json);
    } catch (e) {
      talker.debug("Error parsing question: ${json['question']}");
      talker.debug("Answers data: ${json['answers']}");
      rethrow;
    }
  }

  Map<String, dynamic> toJson() => _$QuestionsListResponseToJson(this);
}
