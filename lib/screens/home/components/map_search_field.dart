import 'dart:async';
import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/bloc/map/map_bloc.dart';
import 'package:protect_ua_women/constants.dart';
import 'package:protect_ua_women/models/map_place.model.dart';
import 'package:protect_ua_women/secrets.dart';
import 'package:http/http.dart' as http;

typedef SetSearchQueryCallback = void Function(String query);
typedef OnSubmitCallback = void Function(double lat, double lng);

class MapSearchField extends StatelessWidget {
  final OnSubmitCallback onSubmit;
  var timer;

  MapSearchField({Key? key, required this.onSubmit}) : super(key: key);

  _searchPlaces(String term, BuildContext context) async {
    if (timer is Timer) {
      timer.cancel();
    }

    timer = Timer(const Duration(seconds: 1), () async {
      context.read<MapBloc>().add(SetSearchResultsByQueryEvent(query: term));
    });
  }

  _handleSubmit(String input, BuildContext context) async {
    if (input.isEmpty) return;

    Uri url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?fields=geometry&inputtype=textquery&input=$input&key=$googleMapAPIkey');
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var res = json['candidates'];
    Map<String, dynamic> location = res[0]['geometry']['location'];
    context.read<MapBloc>().add(SetSearchResultsByQueryEvent(query: ''));
    onSubmit(location['lat'], location['lng']);
  }

  @override
  // ignore: prefer_const_constructors
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      placeholder: 'Enter destination',
      backgroundColor: bgColor,
      borderRadius: const BorderRadius.all(Radius.circular(13)),
      padding: const EdgeInsets.all(12),
      prefixInsets: const EdgeInsetsDirectional.only(start: 12),
      itemColor: primaryColor,
      placeholderStyle:
          const TextStyle(color: Color.fromRGBO(27, 50, 132, 0.2)),
      onChanged: (value) => {_searchPlaces(value, context)},
      onSubmitted: (value) => _handleSubmit(value, context),
    );
  }
}
