import 'package:exam_app_elevate/features/home/subject/data/model/subject_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/subject_entity/subject_entity.dart';
import 'meta_data_model.dart';

part 'subject_response_model.g.dart';

@JsonSerializable()
class SubjectResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "metadata")
  Metadata? metadata;
  @JsonKey(name: "subjects")
  List<Subject>? subjects;

  SubjectResponse({
    this.message,
    this.metadata,
    this.subjects,
  });
  List<SubjectEntity> toDomain() {
    return subjects?.map((e) => e.toDomain()).toList() ?? [];
  }
  factory SubjectResponse.fromJson(Map<String, dynamic> json) => _$SubjectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectResponseToJson(this);
}

