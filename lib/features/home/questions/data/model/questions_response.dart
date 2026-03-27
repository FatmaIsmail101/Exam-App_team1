import 'package:exam_app_elevate/features/home/common_response/message.dart';
import 'package:exam_app_elevate/features/home/questions/data/model/question_types.dart';
import 'package:exam_app_elevate/features/home/questions/data/model/questions_list_response.dart';
import 'package:exam_app_elevate/features/home/questions/domain/entity/question_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'questions_response.g.dart';

@JsonSerializable()
class QuestionsResponse {
  @JsonKey(name: 'message')
  MessageResponse? messageResponse;
  @JsonKey(name: 'questions')
  List<QuestionsListResponse>? questionsListResponse;

  QuestionsResponse({this.messageResponse, this.questionsListResponse});

  factory QuestionsResponse.fromJson(Map<String, dynamic> json) {
    return _$QuestionsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$QuestionsResponseToJson(this);
  // 1. في كلاس الـ QuestionsResponse (اللي بيمثل الـ List كلها)
  List<QuestionEntity> toDomain() {
    return questionsListResponse?.map((questionModel) {
          return QuestionEntity(
            title: questionModel.examResponse?.title ?? "",
            duration: questionModel.examResponse?.duration ?? 0,
            numberOfQuestions:
                questionModel.examResponse?.numberOfQuestions ?? 0,
            answersListResponse: questionModel.answersListResponse ?? [],
            type: questionModel.type ?? QuestionTypes.singleChoice,
            correctAnswerKey: questionModel.correct ?? "",

            // 2. سؤال جديد: هل المستخدم جاوب؟ (في الأول بتبقى false)
            isAnswered: false,
            question: questionModel.question ?? "",
          );
        }).toList() ??
        [];
  }
}
