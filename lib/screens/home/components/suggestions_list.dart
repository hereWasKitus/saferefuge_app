import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:protect_ua_women/constants.dart';
import 'package:protect_ua_women/redux/actions.dart';
import 'package:protect_ua_women/redux/app_state.dart';
import 'package:protect_ua_women/redux/store.dart';
import 'package:protect_ua_women/secrets.dart';
import 'package:redux/redux.dart';
import 'package:protect_ua_women/models/map_place.model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

typedef LocationSelectedCallback = void Function(double lat, double lng);

class SuggestionsList extends StatelessWidget {
  LocationSelectedCallback onLocationSelected;

  SuggestionsList({Key? key, required this.onLocationSelected})
      : super(key: key);

  _goToLocation(String input) async {
    Uri url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?fields=geometry&inputtype=textquery&input=$input&key=$googleMapAPIkey');
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var res = json['candidates'];
    Map<String, dynamic> location = res[0]['geometry']['location'];
    appStore.dispatch(SetSearchResultsAction([]));
    onLocationSelected(location['lat'], location['lng']);
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth =
        MediaQuery.of(context).size.width - defaultPadding * 2;

    return StoreConnector<AppState, List<MapPlace>>(
      converter: (Store<AppState> store) => store.state.searchResults,
      builder: (BuildContext context, List<MapPlace> searchResults) =>
          Positioned(
        top: 85,
        left: defaultPadding,
        width: _screenWidth,
        height: 300,
        child: searchResults.isNotEmpty
            ? Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(13))),
                child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: searchResults.length,
                    itemBuilder: (BuildContext context, int index) => ListTile(
                          title: Text(searchResults[index].description),
                          onTap: () =>
                              _goToLocation(searchResults[index].description),
                        )),
              )
            : Container(),
      ),
    );
  }
}
