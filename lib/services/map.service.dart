import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:protect_ua_women/constants.dart';
import 'package:protect_ua_women/models/category.model.dart';
import 'package:protect_ua_women/models/poi.model.dart';

class MapService {
  Future<List<POI>> fetchPOIs() async {
    Uri url = Uri.parse('$apiURL/poi/');
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body) as List;
    List<POI> pois = json.map((poi) => POI.fromJSON(poi)).toList();
    return pois;
  }

  Future<List<Category>> fetchCategories() async {
    Uri url = Uri.parse('$apiURL/common/');
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body) as List;
    List<Category> categories =
        json.map((cat) => Category.fromJSON(cat)).toList();

    return categories;
  }
}
