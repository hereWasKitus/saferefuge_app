import 'package:safeway_api/safeway_api.dart';

class APIException implements Exception {
  final String message;
  final int? statusCode;

  APIException({required this.message, required this.statusCode});

  factory APIException.fromDioError(DioError error) {
    if (error.response != null && error.response!.statusCode == 402) {
      return APIException(
        message: error.response!.data['detail']['msg'],
        statusCode: error.response!.statusCode,
      );
    }

    return APIException(message: error.response!.data['detail'], statusCode: error.response!.statusCode);
  }

  factory APIException.unknown() => APIException(message: 'Unknown', statusCode: 500);
}
