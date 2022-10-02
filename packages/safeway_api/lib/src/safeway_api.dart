import 'dart:convert';
import 'dart:developer';
import 'package:safeway_api/safeway_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/poi.model.dart';

class SafeWayAPI {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://c4u-match-org.ew.r.appspot.com/',
    headers: {'content-type': 'application/json'},
    connectTimeout: 20000,
    receiveTimeout: 20000,
  ));
  late SharedPreferences _prefs;

  SafeWayAPI() {
    _init();
  }

  void _init() async {
    _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('token');
    _dio.options.headers['Authorization'] =
        token != null ? 'Bearer $token' : '';
  }

  Future<Response> login(String email, String password) async {
    Response response = await _dio.post(
      'aaa/login',
      options: Options(
          headers: {'content-type': 'application/x-www-form-urlencoded'}),
      data: {
        'username': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      var pref = await SharedPreferences.getInstance();
      pref.setString('token', response.data['access_token']);
      _dio.options.headers['Authorization'] =
          'Bearer ${response.data['access_token']}';
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

  Future<Response> getMe() async {
    return _dio.get('users/me/');
  }

  Future<List<POI>> fetchPOIs({
    List<String>? ids,
    int limit = 20,
    int? skip,
    String mode = 'basic',
    List<String>? categories,
    List<String>? organizations,
    String? city,
    String? country,
    bool? approved,
    String? author,
    double? longitude,
    double? latitude,
    double? maxDistance,
  }) async {
    Map<String, dynamic> queryParameters = {
      'limit': limit,
      'fields': mode,
    };

    if (skip != null) {
      queryParameters['skip'] = skip;
    }

    if (categories != null) {
      queryParameters['categories'] = categories.join(',');
    }

    if (organizations != null) {
      queryParameters['organizations'] = organizations.join(',');
    }

    if (city != null) {
      queryParameters['city'] = city;
    }

    if (country != null) {
      queryParameters['country'] = country;
    }

    if (approved != null) {
      queryParameters['approved'] = approved;
    }

    if (author != null) {
      queryParameters['author'] = author;
    }

    if (longitude != null) {
      queryParameters['longitude'] = longitude;
    }

    if (latitude != null) {
      queryParameters['latitude'] = latitude;
    }

    if (maxDistance != null) {
      queryParameters['maxDistance'] = maxDistance;
    }

    Response response = await _dio.get(
      'poi/search',
      queryParameters: queryParameters,
    );

    List<POI> pois =
        response.data['items'].map<POI>((n) => POI.fromJson(n)).toList();

    return pois;
  }

  Future<Response> getOrganizations({int limit = 100}) {
    return _dio.get('org/', queryParameters: {
      'limit': limit,
    });
  }

  Future<List<POICategory>> fetchCategories({int limit = 100}) async {
    Response response = await _dio.get('common/', queryParameters: {
      'limit': limit,
    });

    List<POICategory> categories = response.data['items']
        .map<POICategory>((n) => POICategory.fromJson(n))
        .toList();

    return categories;
  }

  Future<Response> createPOI(Map<String, dynamic> poi) {
    return _dio.post(
      'poi/',
      data: json.encode(
        <String, dynamic>{
          'name': poi['name'],
          'description': poi['description'],
          'latilong': [
            poi['latitude'],
            poi['longitude'],
          ],
          'categories': poi['categories'],
          'city': poi['city'],
          'country': poi['country'],
          'languages': poi['languages'],
          'phone': poi['phone'],
          'contact_person': poi['contactPerson'],
          'address': poi['address'],
          'telegram': poi['telegram'],
          'whatsapp': poi['whatsapp'],
          'url': poi['url'],
          // add telegram and whatsapp later
        },
      ),
    );
  }

  Future<Response> updatePOI(Map<String, dynamic> poi) {
    return _dio.put(
      'poi/',
      queryParameters: {
        'id': poi['id'],
      },
      data: json.encode(
        <String, dynamic>{
          'name': poi['name'],
          'description': poi['description'],
          // 'latilong': [
          //   poi['latitude'],
          //   poi['longitude'],
          // ],
          'categories': poi['categories'],
          'city': poi['city'],
          'country': poi['country'],
          'languages': poi['languages'],
          'phone': poi['phone'],
          'contact_person': poi['contactPerson'],
          'url': poi['url'],
          // add telegram and whatsapp later
        },
      ),
    );
  }

  Future<void> logout() async {
    var pref = await SharedPreferences.getInstance();
    pref.remove('token');
    _dio.options.headers['Authorization'] = '';
  }

  Future<Response> deleteMe({required String password}) async {
    return _dio.delete('users/delete/me', queryParameters: {
      'current_password': password,
      'force': true,
    });
  }

  Future<Response> requestPasswordReset({required String email}) async {
    return _dio.get('email/reset-password-request/', queryParameters: {
      'email': email,
    });
  }
}
