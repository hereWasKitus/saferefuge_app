import 'package:safeway_api/safeway_api.dart';

import 'models/models.dart';

/// Checks if you are awesome. Spoiler: you are.
class MapRepository {
  final SafeWayAPI _api;
  final String googleApiKey;
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://maps.googleapis.com/maps/api/',
  ));

  MapRepository({required this.googleApiKey, required SafeWayAPI api}) : _api = api;

  Future<List> autocomplete(String query) async {
    var response = await _dio.get('place/autocomplete/json?input=$query&key=$googleApiKey');
    var results = response.data['predictions'] as List;
    return results;
  }

  Future searchPlaces(String query) async {
    var response = await _dio
        .get('place/findplacefromtext/json?fields=geometry&inputtype=textquery&input=$query&key=$googleApiKey');
    return response.data;
  }

  Future getAddressByLocation(double latitude, double longitude) async {
    var response = await _dio.get('geocode/json?latlng=$latitude,$longitude&key=$googleApiKey');
    return response.data;
  }

  Future<void> createPOI(Map<String, dynamic> poi) async {
    try {
      await _api.createPOI(poi);
    } on DioError catch (e) {
      throw APIException.fromDioError(e);
    } catch (e) {
      throw APIException.unknown();
    }
  }

  Future<List<POI>> getPOIs() async {
    try {
      var response = await _api.getPOIs(limit: 2500);
      List pois = response.data['items'].map((item) => POI.fromMap(item)).toList();
      return List<POI>.from(pois);
    } on DioError catch (e) {
      throw APIException.fromDioError(e);
    } catch (e) {
      throw APIException.unknown();
    }
  }

  Future<List<POI>> getPOIsByUsername(String username) async {
    try {
      var response = await _api.getPOIs(author: username, mode: 'full');
      List pois = response.data['items'].map((item) => POI.fromMap(item)).toList();
      return List<POI>.from(pois);
    } on DioError catch (e) {
      throw APIException.fromDioError(e);
    } catch (e) {
      throw APIException.unknown();
    }
  }

  Future<List<POI>> getPOIsByID(List<String> ids) async {
    try {
      var response = await _api.getPOIs(ids: ids, mode: 'full');
      List pois = response.data['items'].map((item) => POI.fromMap(item)).toList();
      return List<POI>.from(pois);
    } on DioError catch (e) {
      throw APIException.fromDioError(e);
    } catch (e) {
      throw APIException.unknown();
    }
  }

  Future<List<POI>> getNearbyPOIs({required double lat, required double lng, int? limit, double? maxDistance}) async {
    try {
      var response = await _api.getNearbyPOIs(
        limit: limit,
        lat: lat,
        lng: lng,
        maxDistance: maxDistance,
      );
      List pois = response.data['items'].map((item) => POI.fromMap(item)).toList();
      return List<POI>.from(pois);
    } on DioError catch (e) {
      throw APIException.fromDioError(e);
    } catch (e) {
      throw APIException.unknown();
    }
  }

  Future<List<Category>> getCategories() async {
    List categories = [];

    try {
      Response response = await _api.getCategories();
      categories = response.data['items'].map((cat) => Category.fromMap(cat)).toList();
      return List<Category>.from(categories);
    } catch (e) {
      return List<Category>.from(categories);
    }
  }

  Future updatePOI(Map<String, dynamic> poi) async {
    try {
      await _api.updatePOI(poi);
    } on DioError catch (e) {
      throw APIException.fromDioError(e);
    } catch (e) {
      throw APIException.unknown();
    }
  }
}
