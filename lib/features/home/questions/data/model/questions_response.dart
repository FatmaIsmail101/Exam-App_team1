import 'package:exam_app_elevate/features/home/questions/data/model/questions_list_response.dart';
import 'package:exam_app_elevate/features/home/questions/domain/entity/question_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../main.dart';

part 'questions_response.g.dart';

@JsonSerializable()
class QuestionsResponse {
  @JsonKey(name: 'message')
  String? messageResponse;
  @JsonKey(name: 'questions', fromJson: _questionsFromJson)
  List<QuestionsListResponse>? questionsListResponse;

  QuestionsResponse({this.messageResponse, this.questionsListResponse});

  factory QuestionsResponse.fromJson(Map<String, dynamic> json) {
    return _$QuestionsResponseFromJson(json);
  }

  static List<QuestionsListResponse>? _questionsFromJson(Object? json) {
    if (json == null) return null;
    if (json is List) {
      return json.map((e) {
        try {
          // تأكدي إن العنصر فعلاً Map قبل ما تبعتيه للـ factory
          // فحص إضافي قبل الـ cast
          if (e is Map<String, dynamic>) {
            return QuestionsListResponse.fromJson(e);
          }
          return QuestionsListResponse();
        } catch (error) {
          talker.error("Error parsing individual question: $error");
          // بنرجع كائن فاضي أو سؤال فيه داتا وهمية عشان التطبيق ميكراشش
          return QuestionsListResponse();
        }
      }).toList();
    }
    return [];
  }

  Map<String, dynamic> toJson() => _$QuestionsResponseToJson(this);

  // 1. في كلاس الـ QuestionsResponse (اللي بيمثل الـ List كلها)
  List<QuestionEntity> toDomain() {
    return questionsListResponse?.map((questionModel) {
          return QuestionEntity(
            title: questionModel.examResponse?.title ?? "",
            answersListResponse: questionModel.answersListResponse ?? [],
            type: questionModel.type ?? "",
            correctAnswerKey: questionModel.correct ?? "",
            question: questionModel.question ?? "",
            userAnswer: "",
          );
        }).toList() ??
        [];
  }
}
