import 'dart:developer';

import 'package:safeway_api/safeway_api.dart';
import 'models/models.dart';

class AuthRepository {
  final SafeWayAPI _api;

  AuthRepository({required SafeWayAPI api}) : _api = api;

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

  Future<RegistrationResponse> register(
      String fullName, String email, String password) async {
    try {
      Response response = await _api.register(fullName, email, password);
      return RegistrationResponse.fromMap(response.data);
    } on DioError catch (e) {
      throw RegistrationFailure.fromDioError(e);
    } catch (e) {
      throw RegistrationFailure.unknown();
    }
  }

  // Future registerOrganization({
  //   String username = '',
  //   String name = '',
  //   String email = '',
  //   String phone = '',
  //   String website = '',
  //   String address = '',
  //   String city = '',
  //   String country = '',
  //   List<String> categories = const [],
  // }) async {
  //   try {
  //     await _api.registerOrAssignToOrganization(
  //       username: username,
  //       name: name,
  //       email: email,
  //       phone: phone,
  //       website: website,
  //       address: address,
  //       city: city,
  //       country: country,
  //       categories: categories,
  //     );
  //   } on DioError catch (e) {
  //     throw OrganizationCreationFailure.fromDioError(e);
  //   } catch (e) {
  //     throw OrganizationCreationFailure.unknown();
  //   }
  // }

  // Future registerOrAssignToOrganization({
  //   String username = '',
  //   String name = '',
  //   String email = '',
  //   String phone = '',
  //   String website = '',
  //   String address = '',
  //   String city = '',
  //   String country = '',
  //   String formalID = '',
  //   String whatsapp = '',
  //   String telegram = '',
  //   String positionInOrganization = '',
  //   List<String> categories = const [],
  // }) async {
  //   try {
  //     await _api.registerOrAssignToOrganization(
  //       username: username,
  //       name: name,
  //       email: email,
  //       phone: phone,
  //       website: website,
  //       address: address,
  //       city: city,
  //       country: country,
  //       categories: categories,
  //       formalID: formalID,
  //       whatsapp: whatsapp,
  //       telegram: telegram,
  //       positionInOrganization: positionInOrganization,
  //     );
  //   } on DioError catch (e) {
  //     throw APIException.fromDioError(e);
  //   } catch (e) {
  //     throw APIException.unknown();
  //   }
  // }

  Future<User> getCurrentUser() async {
    try {
      Response userResponse = await _api.getMe();
      User user = User.fromMap(userResponse.data);
      return user;
    } catch (e) {
      return User.empty();
    }
  }

  Future<List<Organization>> getOrganizations() async {
    List organizations = [];

    try {
      var response = await _api.getOrganizations();
      organizations = response.data['items']
          .map((item) => Organization.fromMap(item))
          .toList();
      return List<Organization>.from(organizations);
    } catch (e) {
      // throw APIException.unknown();
      return List<Organization>.from(organizations);
    }
  }

  Future<void> logout() async {
    try {
      _api.logout();
    } on DioError catch (e) {
      throw APIException.fromDioError(e);
    } catch (e) {
      throw APIException.unknown();
    }
  }

  Future<String> requestPasswordReset({required String email}) async {
    try {
      Response response = await _api.requestPasswordReset(email: email);
      debugger(when: true);
      return response.data['message'];
    } on DioError catch (e) {
      throw APIException.fromDioError(e);
    } catch (e) {
      throw APIException.unknown();
    }
  }
}
