// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthBaseResponse _$AuthBaseResponseFromJson(Map<String, dynamic> json) =>
    AuthBaseResponse(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : UserDTO.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthBaseResponseToJson(AuthBaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };
