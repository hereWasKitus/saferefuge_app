import 'package:safeway_api/safeway_api.dart';

class RegistrationFailure implements Exception {
  final String message;
  final int? statusCode;

  RegistrationFailure({required this.message, required this.statusCode});

  factory RegistrationFailure.fromDioError(DioError error) {
    return RegistrationFailure(message: error.response!.data['detail'], statusCode: error.response!.statusCode);
  }

  factory RegistrationFailure.unknown() => RegistrationFailure(message: 'Unknown', statusCode: 500);
}
