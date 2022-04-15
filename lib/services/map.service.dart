import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:protect_ua_women/constants.dart';
import 'package:protect_ua_women/models/category.model.dart';
import 'package:protect_ua_women/models/poi.model.dart';
import 'package:protect_ua_women/redux/actions.dart';
import 'package:protect_ua_women/redux/store.dart';

class MapService {
  Future<void> initializePOI() async {
    Uri url = Uri.parse('$apiURL/poi/');
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body) as List;
    List<POI> pois = json.map((poi) => POI.fromJSON(poi)).toList();
    appStore.dispatch(SetPOIsAction(pois));
  }

  Future<void> initializeCategories() async {
    Uri url = Uri.parse('$apiURL/common/');
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body) as List;
    List<Category> categories =
        json.map((cat) => Category.fromJSON(cat)).toList();

    appStore.dispatch(SetCategoriesAction(categories));
  }
}