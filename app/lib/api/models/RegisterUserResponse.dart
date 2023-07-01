  import 'package:json_annotation/json_annotation.dart';
  part 'RegisterUserResponse.g.dart';

  @JsonSerializable()
  class RegisterUserResponse {
    final String email;
    final String token;
    final bool success;

    RegisterUserResponse({required this.success, required this.email, required this.token});

    factory RegisterUserResponse.fromJson(Map<String, dynamic> json) =>
        _$RegisterUserResponseFromJson(json);
    Map<String, dynamic> toJson() => _$RegisterUserResponseToJson(this);
  }
