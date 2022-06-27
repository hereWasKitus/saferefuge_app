import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SafeWayAPI {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://c4u-match-org.ew.r.appspot.com/',
    headers: {'content-type': 'application/json'},
  ));

  SafeWayAPI() {
    _init();
  }

  void _init() async {
    var pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    _dio.options.headers['Authorization'] = token != null ? 'Bearer $token' : '';
  }

  Future<Response> login(String email, String password) async {
    Response response = await _dio.post(
      'aaa/login',
      options: Options(headers: {'content-type': 'application/x-www-form-urlencoded'}),
      data: {
        'username': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      var pref = await SharedPreferences.getInstance();
      pref.setString('token', response.data['access_token']);
      _dio.options.headers['Authorization'] = 'Bearer ${response.data['access_token']}';
    }

    return response;
  }

  Future<Response> register(
    String fullName,
    String email,
    String password,
  ) async {
    return _dio.post(
      'aaa/register',
      data: json.encode({
        'username': email,
        'email': email,
        'password': password,
        'full_name': fullName,
      }),
    );
  }

  Future<Response> registerOrAssignToOrganization({
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
    var response = await _dio.post(
      'org/assign',
      data: json.encode({
        'username': username,
        'name': name,
        'email': email,
        'phone': phone,
        'website': website,
        'address': address,
        'city': city,
        'country': country,
        'categories': categories,
        'formal_id': formalID,
        'whatsapp': whatsapp,
        'telegram': telegram,
        'position': positionInOrganization,
      }),
    );

    return response;
  }

  Future<Response> getMe() async {
    return _dio.get('users/me/');
  }

  Future<Response> getOrganization({required String username}) async {
    return await _dio.get(
      'org/get/$username',
    );
  }

  Future<Response> updateOrganization({
    required String username,
    String? organizationName,
    String? organizationEmail,
    String? organizationPhone,
  }) async {
    Map<String, dynamic> request = {};

    if (organizationName != null) request['name'] = organizationName;
    if (organizationEmail != null) request['email'] = organizationEmail;
    if (organizationPhone != null) request['phone'] = organizationPhone;

    return await _dio.put(
      'org/$username',
      data: json.encode(request),
    );
  }

  Future<Response> updateUser({
    required String userID,
    String? email,
    String? fullName,
    String? password,
  }) async {
    Map<String, dynamic> request = {};

    if (email != null) {
      request['username'] = email;
      request['email'] = email;
    }

    if (fullName != null) request['full_name'];
    if (password != null) request['password'];

    return await _dio.patch(
      'aaa/user/patch',
      data: json.encode(request),
      queryParameters: {'_id': userID},
    );
  }

  Future<Response> getPOIs({int limit = 100}) {
    return _dio.get('poi/', queryParameters: {
      'limit': limit,
      'fields': 'compact',
    });
  }

  Future<Response> getNearbyPOIs({required double lat, required double lng, int? limit, double? maxDistance}) {
    return _dio.get('poi/', queryParameters: {
      'limit': limit ?? 0,
      'latitdue': lat,
      'longitude': lng,
      'max_distance': maxDistance ?? 50000,
    });
  }

  Future<Response> getOrganizations({int limit = 100}) {
    return _dio.get('org/', queryParameters: {
      'limit': limit,
    });
  }

  Future<Response> getCategories({int limit = 100}) {
    return _dio.get('common/', queryParameters: {
      'limit': limit,
    });
  }
}
