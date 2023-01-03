import 'dart:developer';

import 'package:safeway_api/safeway_api.dart';

import '../models/models.dart';

class CountriesService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://countriesnow.space/api/v0.1/countries/',
    headers: {'content-type': 'application/json'},
    connectTimeout: 20000,
    receiveTimeout: 20000,
  ));

  Future<List<Country>> fetchCountries() async {
    try {
      final response = await _dio.get('positions');
      List<Country> countries = response.data['data']
          .map<Country>((n) => Country.fromJson(n))
          .toList();
      return countries;
    } catch (e) {
      debugger(when: true);
      return [];
    }
  }
}
