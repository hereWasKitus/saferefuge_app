import 'package:safeway_api/safeway_api.dart';

class LoginFailure implements Exception {
  final String message;
  final int? statusCode;

  LoginFailure({required this.message, required this.statusCode});

  factory LoginFailure.fromDioError(DioError error) {
    return LoginFailure(message: error.response!.data['detail'], statusCode: error.response!.statusCode!.toInt());
  }

  factory LoginFailure.unknown() => LoginFailure(message: 'Unknown', statusCode: 500);
}
