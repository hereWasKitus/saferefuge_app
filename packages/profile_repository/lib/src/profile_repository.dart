import 'package:safeway_api/safeway_api.dart';

class ProfileRepository {
  final SafeWayAPI _api;

  ProfileRepository({required SafeWayAPI api}) : _api = api;

  Future<void> updateProfile({
    required String userEmail,
    String? userFullName,
    String? userPassword,
    String? organizationName,
    String? organizationEmail,
    String? organizationPhone,
    String? organizationPosition,
  }) async {
    Map<String, dynamic> organizationRequest = {};
    Map<String, dynamic> userRequest = {};

    if (organizationName != null) organizationRequest['name'] = organizationName;
    if (organizationEmail != null) organizationRequest['email'] = organizationEmail;
    if (organizationPhone != null) organizationRequest['phone'] = organizationPhone;
    if (userFullName != null) userRequest['full_name'];
    if (userPassword != null) userRequest['password'];

    try {
      await _api.updateUser(email: userEmail, fullName: userFullName, orgPosition: organizationPosition);
      // await _api.updateOrganization(
      //   username: userEmail,
      //   organizationEmail: organizationEmail,
      //   organizationName: organizationName,
      //   organizationPhone: organizationPhone,
      // );
    } on DioError catch (e) {
      throw APIException.fromDioError(e);
    } catch (e) {
      throw APIException.unknown();
    }
  }
}
