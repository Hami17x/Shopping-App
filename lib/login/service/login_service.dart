import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_demo_uygulama/login/model/user_request_model.dart';
import 'package:flutter_demo_uygulama/login/model/user_response_model.dart';

abstract class ILoginService {
  final Dio dio;

  ILoginService(this.dio);

  Future<UserResponseModel?> login(UserRequestModel userRequestModel);
}

class LoginService extends ILoginService {
  LoginService(super.dio);

  @override
  Future<UserResponseModel?> login(UserRequestModel userRequestModel) async {
    try {
      final response = await dio.post("login-submit", data: userRequestModel);
      if (response.statusCode == 200) {
        return UserResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      log(e.message);
    }
    return null;
  }
}
