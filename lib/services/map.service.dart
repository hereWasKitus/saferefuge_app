import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/home/home.dart';
import 'package:protect_ua_women/models/poi_response.model.dart';

class MapService {
  Future<List<POI>> fetchPOIs() async {
    Uri url = Uri.parse('$apiURL/poi?limit=0');
    var response = await http.get(url);
    print(response);
    var json = POIResponse.fromJSON(convert.jsonDecode(response.body));
    List<POI> pois = json.count == 0 ? [] : json.items.map((poi) => POI.fromJSON(poi)).toList();
    return pois;
  }

  Future<List<Category>> fetchCategories() async {
    Uri url = Uri.parse('$apiURL/common/');
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body) as List;
    List<Category> categories = json.map((cat) => Category.fromJSON(cat)).toList();

    return categories;
  }
}
