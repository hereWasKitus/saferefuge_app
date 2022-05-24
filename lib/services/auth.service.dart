import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:protect_ua_women/config/constants.dart';

class AuthService {
  Future<ResponseData> registerOrganization({
    String name = '',
    String email = '',
    String phone = '',
    String address = '',
    List<String> categories = const [],
    LatLng? position,
  }) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$apiURL/org/'));
    request.body = json.encode({
      "username": email.split('@')[0],
      "name": name,
      "email": email,
      "phone": phone,
      "website": "",
      "approved": false,
      "address": address,
      "city": "",
      "country": "",
      "lat": position?.latitude,
      "lng": position?.longitude,
      "categories": categories
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    ResponseData data =
        ResponseData(statusCode: response.statusCode, data: json.decode(await response.stream.bytesToString()));

    return data;
  }

  static Future login({String email = '', String password = ''}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$apiURL/aaa/login'));

    request.body = json.encode({
      'username': email,
      'password': password,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    ResponseData data =
        ResponseData(statusCode: response.statusCode, data: json.decode(await response.stream.bytesToString()));

    return data;
  }
}

class ResponseData {
  final int statusCode;
  final Map<String, dynamic> data;

  const ResponseData({
    this.statusCode = 200,
    this.data = const {},
  });
}
