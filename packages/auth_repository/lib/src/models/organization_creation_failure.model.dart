import 'package:safeway_api/safeway_api.dart';

class OrganizationCreationFailure implements Exception {
  final String message;
  final int? statusCode;

  OrganizationCreationFailure({required this.message, required this.statusCode});

  factory OrganizationCreationFailure.fromDioError(DioError error) {
    return OrganizationCreationFailure(message: error.response!.data['detail'], statusCode: error.response!.statusCode);
  }

  factory OrganizationCreationFailure.unknown() => OrganizationCreationFailure(message: 'Unknown', statusCode: 500);
}
