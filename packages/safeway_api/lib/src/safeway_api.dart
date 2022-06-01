import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:safeway_api/src/models/models.dart';
import 'package:safeway_api/src/models/registration_response.model.dart';

class SafeWayAPI {
  SafeWayAPI();

  final String _googleMapAPIkey = 'AIzaSyDYan5h3tNojBrct_ENaV6n-On7iXw1PuM';
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://c4u-match-org.ew.r.appspot.com/',
  ));

  Future<LoginResponse> login(String email, String password) async {
    try {
      Response response = await _dio.post(
        'aaa/login',
        options: Options(headers: {'content-type': 'application/x-www-form-urlencoded'}),
        data: {
          'username': email,
          'password': password,
        },
      );

      return LoginResponse(success: true, data: response.data);
    } on DioError catch (e) {
      return LoginResponse(success: false, err: e.message, data: e.response!.data);
    }
  }

  Future<RegistrationResponse> register(String fullName, String email, String password) async {
    try {
      Response response = await _dio.post(
        'aaa/register',
        options: Options(headers: {'content-type': 'application/json'}),
        data: json.encode({
          'username': email,
          'email': email,
          'password': password,
          'full_name': fullName,
        }),
      );

      return RegistrationResponse(success: true, data: response.data);
    } on DioError catch (e) {
      return RegistrationResponse(success: false, err: e.message, data: e.response!.data);
    }
  }
}
