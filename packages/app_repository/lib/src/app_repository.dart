// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.
// ignore_for_file: public_member_api_docs

import 'package:safeway_api/safeway_api.dart';

class AppRepository {
  const AppRepository({required SafeWayAPI api}) : _api = api;

  final SafeWayAPI _api;

  Future<List<POICategory>> fetchCategories() async {
    try {
      final cats = await _api.fetchCategories();
      return cats;
    } on DioError catch (e) {
      throw APIException.fromDioError(e);
    }
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
    try {
      final pois = await _api.fetchPOIs(
        ids: ids,
        limit: limit,
        skip: skip,
        mode: mode,
        categories: categories,
        organizations: organizations,
        city: city,
        country: country,
        approved: approved,
        latitude: latitude,
        longitude: longitude,
      );
      return pois;
    } on DioError catch (e) {
      throw APIException.fromDioError(e);
    }
  }
}
