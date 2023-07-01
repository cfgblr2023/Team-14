import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'models/RegisterUserRequest.dart';
import 'models/RegisterUserResponse.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: "http://10.0.2.2:9000/")
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST("/register-user")
  Future<RegisterUserResponse> registerUser(
      @Body() RegisterUserRequest registerUserRequest);
}