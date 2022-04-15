import 'dart:async';
import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:protect_ua_women/constants.dart';
import 'package:protect_ua_women/models/map_place.model.dart';
import 'package:protect_ua_women/redux/actions.dart';
import 'package:protect_ua_women/redux/app_state.dart';
import 'package:protect_ua_women/redux/store.dart';
import 'package:redux/redux.dart';
import 'package:protect_ua_women/secrets.dart';
import 'package:http/http.dart' as http;

typedef SetSearchQueryCallback = void Function(String query);
typedef OnSubmitCallback = void Function(double lat, double lng);

class MapSearchField extends StatelessWidget {
  final OnSubmitCallback onSubmit;
  var timer;

  MapSearchField({Key? key, required this.onSubmit}) : super(key: key);

  _searchPlaces(String term) async {
    if (timer is Timer) {
      timer.cancel();
    }

    timer = Timer(const Duration(seconds: 1), () async {
      Uri url = Uri.parse(
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$term&key=$googleMapAPIkey');
      var response = await http.get(url);
      var json = convert.jsonDecode(response.body);
      var results = json['predictions'] as List;
      var places = results.map((place) => MapPlace.fromJson(place)).toList();
      appStore.dispatch(SetSearchResultsAction(places));
    });
  }

  _handleSubmit(String input) async {
    if (input.isEmpty) return;

    Uri url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?fields=geometry&inputtype=textquery&input=$input&key=$googleMapAPIkey');
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var res = json['candidates'];
    Map<String, dynamic> location = res[0]['geometry']['location'];
    appStore.dispatch(SetSearchResultsAction([]));
    onSubmit(location['lat'], location['lng']);
  }

  @override
  // ignore: prefer_const_constructors
  Widget build(BuildContext context) =>
      StoreConnector<AppState, SetSearchQueryCallback>(
        converter: (Store<AppState> store) =>
            (String value) => _searchPlaces(value),
        builder: (context, SetSearchQueryCallback setSearchQuery) =>
            CupertinoSearchTextField(
          placeholder: 'Enter destination',
          backgroundColor: bgColor,
          borderRadius: BorderRadius.all(Radius.circular(13)),
          padding: EdgeInsets.all(12),
          prefixInsets: EdgeInsetsDirectional.only(start: 12),
          itemColor: primaryColor,
          placeholderStyle: TextStyle(color: Color.fromRGBO(27, 50, 132, 0.2)),
          onChanged: (value) => setSearchQuery(value),
          onSubmitted: _handleSubmit,
        ),
      );
}
