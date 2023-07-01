// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RegisterUserResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterUserResponse _$RegisterUserResponseFromJson(
        Map<String, dynamic> json) =>
    RegisterUserResponse(
      success: json['success'] as bool,
      email: json['email'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$RegisterUserResponseToJson(
        RegisterUserResponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'token': instance.token,
      'success': instance.success,
    };
