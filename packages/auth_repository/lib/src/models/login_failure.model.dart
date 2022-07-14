import 'package:safeway_api/safeway_api.dart';

class LoginFailure implements Exception {
  final String message;
  final int? statusCode;

  LoginFailure({required this.message, required this.statusCode});

  factory LoginFailure.fromDioError(DioError error) {
    if (error.type == DioErrorType.connectTimeout || error.type == DioErrorType.receiveTimeout) {
      return LoginFailure(
        message: 'Timeout',
        statusCode: 500,
      );
    }

    if (error.response != null && error.response!.statusCode == 402) {
      return LoginFailure(
        message: error.response!.data['detail']['msg'],
        statusCode: error.response!.statusCode,
      );
    }

    return LoginFailure(message: error.response!.data['detail'], statusCode: error.response!.statusCode);
  }

  factory LoginFailure.unknown() => LoginFailure(message: 'Unknown', statusCode: 500);
}
