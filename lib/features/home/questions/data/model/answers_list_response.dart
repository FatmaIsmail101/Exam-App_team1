import 'package:json_annotation/json_annotation.dart';

part 'answers_list_response.g.dart';

@JsonSerializable()
class AnswersListResponse {
  @JsonKey(name: 'key')
  String? key;
  @JsonKey(name: 'answer')
  String? answer;
  AnswersListResponse({this.key, this.answer});

  Map<String, dynamic> toJson() => _$AnswersListResponseToJson(this);

  factory AnswersListResponse.fromJson(Map<String, dynamic> json) =>
      _$AnswersListResponseFromJson(json);
}
