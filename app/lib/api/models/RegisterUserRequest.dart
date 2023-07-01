  import 'package:json_annotation/json_annotation.dart';
  part 'RegisterUserRequest.g.dart';

  @JsonSerializable()
  class RegisterUserRequest {
    final String name;
    final String email;
    final String password;

    RegisterUserRequest({required this.name, required this.email, required this.password});

    factory RegisterUserRequest.fromJson(Map<String, dynamic> json) =>
        _$RegisterUserRequestFromJson(json);
    Map<String, dynamic> toJson() => _$RegisterUserRequestToJson(this);
  }
