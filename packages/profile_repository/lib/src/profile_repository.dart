import 'package:safeway_api/safeway_api.dart';

class ProfileRepository {
  final SafeWayAPI _api;

  ProfileRepository({required SafeWayAPI api}) : _api = api;

  Future<void> updateProfile({
    String? userEmail,
    String? userFullName,
    String? userPassword,
    String? organizationName,
    String? organizationEmail,
    String? organizationPhone,
    String? organizationPosition,
    List<String>? onboardingStatus,
  }) async {
    Map<String, dynamic> organizationRequest = {};
    Map<String, dynamic> userRequest = {};

    if (organizationName != null) organizationRequest['name'] = organizationName;
    if (organizationEmail != null) organizationRequest['email'] = organizationEmail;
    if (organizationPhone != null) organizationRequest['phone'] = organizationPhone;
    if (userFullName != null) userRequest['full_name'];
    if (userPassword != null) userRequest['password'];

    try {
      await _api.updateUser(
        email: userEmail,
        fullName: userFullName,
        orgPosition: organizationPosition,
        onboardingStatus: onboardingStatus,
      );
    } on DioError catch (e) {
      throw APIException.fromDioError(e);
    } catch (e) {
      throw APIException.unknown();
    }
  }

  Future<void> dangerousUpdateProfile({
    required String userID,
    String? userEmail,
    String? userPassword,
    String? userUsername,
  }) async {
    try {
      await _api.dangerousUpdateUser(
        userID: userID,
        email: userEmail,
        username: userUsername,
        password: userPassword,
      );
    } on DioError catch (e) {
      throw APIException.fromDioError(e);
    } catch (e) {
      throw APIException.unknown();
    }
  }

  Future<void> deleteMe({required String password}) async {
    try {
      Response response = await _api.deleteMe(password: password);

      // remove it after it will be fixed on backend
      if (response.data == 'Incorrect password') {
        throw APIException(message: 'Incorrect password', statusCode: 422);
      }
    } on DioError catch (e) {
      throw APIException.fromDioError(e);
    } catch (e) {
      throw APIException.unknown();
    }
  }
}
