import 'package:safeway_api/safeway_api.dart';
import 'models/models.dart';

class AuthRepository {
  final SafeWayAPI _api = SafeWayAPI();

  Future<User> login(String email, String password) async {
    try {
      await _api.login(email, password);
      Response userResponse = await _api.getMe();
      User user = User.fromMap(userResponse.data);
      return user;
    } on DioError catch (e) {
      throw LoginFailure.fromDioError(e);
    } catch (e) {
      throw LoginFailure.unknown();
    }
  }

  Future<RegistrationResponse> register(String fullName, String email, String password) async {
    try {
      Response response = await _api.register(fullName, email, password);
      return RegistrationResponse.fromMap(response.data);
    } on DioError catch (e) {
      throw RegistrationFailure.fromDioError(e);
    } catch (e) {
      throw RegistrationFailure.unknown();
    }
  }

  Future registerOrganization({
    String username = '',
    String name = '',
    String email = '',
    String phone = '',
    String website = '',
    String address = '',
    String city = '',
    String country = '',
    List<String> categories = const [],
  }) async {
    try {
      await _api.registerOrAssignToOrganization(
        username: username,
        name: name,
        email: email,
        phone: phone,
        website: website,
        address: address,
        city: city,
        country: country,
        categories: categories,
      );
    } on DioError catch (e) {
      throw OrganizationCreationFailure.fromDioError(e);
    } catch (e) {
      throw OrganizationCreationFailure.unknown();
    }
  }

  Future registerOrAssignToOrganization({
    String username = '',
    String name = '',
    String email = '',
    String phone = '',
    String website = '',
    String address = '',
    String city = '',
    String country = '',
    String formalID = '',
    String whatsapp = '',
    String telegram = '',
    String positionInOrganization = '',
    List<String> categories = const [],
  }) async {
    try {
      await _api.registerOrAssignToOrganization(
        username: username,
        name: name,
        email: email,
        phone: phone,
        website: website,
        address: address,
        city: city,
        country: country,
        categories: categories,
        formalID: formalID,
        whatsapp: whatsapp,
        telegram: telegram,
        positionInOrganization: positionInOrganization,
      );
    } on DioError catch (e) {
      throw APIException.fromDioError(e);
    } catch (e) {
      throw APIException.unknown();
    }
  }

  Future<User> getCurrentUser() async {
    try {
      Response userResponse = await _api.getMe();
      User user = User.fromMap(userResponse.data);
      return user;
    } catch (e) {
      return User.empty();
    }
  }

  Future<void> updateProfile({
    required userID,
    required String userEmail,
    String? userFullName,
    String? userPassword,
    String? organizationName,
    String? organizationEmail,
    String? organizationPhone,
  }) async {
    Map<String, dynamic> organizationRequest = {};
    Map<String, dynamic> userRequest = {};

    if (organizationName != null) organizationRequest['name'] = organizationName;
    if (organizationEmail != null) organizationRequest['email'] = organizationEmail;
    if (organizationPhone != null) organizationRequest['phone'] = organizationPhone;
    if (userFullName != null) userRequest['full_name'];
    if (userPassword != null) userRequest['password'];

    try {
      await _api.updateUser(userID: userID, email: userEmail);
      await _api.updateOrganization(
        username: userEmail,
        organizationEmail: organizationEmail,
        organizationName: organizationName,
        organizationPhone: organizationPhone,
      );
    } on DioError catch (e) {
      throw APIException.fromDioError(e);
    } catch (e) {
      throw APIException.unknown();
    }
  }

  Future<List<Organization>> getOrganizations() async {
    List organizations = [];

    try {
      var response = await _api.getOrganizations();
      organizations = response.data['items'].map((item) => Organization.fromMap(item)).toList();
      return List<Organization>.from(organizations);
    } catch (e) {
      // throw APIException.unknown();
      return List<Organization>.from(organizations);
    }
  }
}
