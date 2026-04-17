// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamResponse _$ExamResponseFromJson(Map<String, dynamic> json) => ExamResponse()
  ..id = json['_id'] as String?
  ..title = json['title'] as String?
  ..subject = json['subject'] as String?
  ..duration = (json['duration'] as num?)?.toInt()
  ..numberOfQuestions = (json['numberOfQuestions'] as num?)?.toInt()
  ..active = json['active'] as bool?
  ..createdAt = json['createdAt'] as String?;

Map<String, dynamic> _$ExamResponseToJson(ExamResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'subject': instance.subject,
      'duration': instance.duration,
      'numberOfQuestions': instance.numberOfQuestions,
      'active': instance.active,
      'createdAt': instance.createdAt,
    };
