import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:protect_ua_women/models/registration_form.model.dart';
import 'package:protect_ua_women/constants.dart';

class AuthService {
  Future registerOrganization(RegistrationForm form) async {
    try {
      String requestBody = convert.jsonEncode(
        <String, dynamic>{
          "username": form.email?.split('@')[0],
          "name": form.name,
          "email": form.email,
          "phone": form.phone,
          "website": "",
          "approved": false,
          "address": form.address,
          "city": "",
          "country": "",
          "lat": form.latLng?.latitude,
          "lng": form.latLng?.longitude,
          "categories": form.categories
        },
      );

      var response = await http.post(
        Uri.parse('$apiURL/org'),
        body: requestBody,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
      );

      print(response.statusCode);

      // var json = convert.jsonDecode(response.body);
    } catch (e) {
      print(e.toString());
    }
  }
}

/**
 * {
  "username": "org_user",
  "name": "Help Org",
  "email": "user@help.org",
  "phone": "+38-12345678",
  "website": "https://www.help.org",
  "approved": true,
  "address": "Pol's'kyi descent",
  "city": "Odessa",
  "country": "Ukraine",
  "lat": 46.484486203259415,
  "lng": 30.746438141417606,
  "categories": [
    "Clothes",
    "Accommodation"
  ]
}
 */