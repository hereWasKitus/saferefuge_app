import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/core/config/constants.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../home.dart';

class SuggestionsList extends StatelessWidget {
  final Function onLocationSelected;

  const SuggestionsList({Key? key, required this.onLocationSelected}) : super(key: key);

  _goToLocation(String input, BuildContext context) async {
    Uri url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?fields=geometry&inputtype=textquery&input=$input&key=${dotenv.env['GOOGLE_MAP_API_KEY']}');
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var res = json['candidates'];
    Map<String, dynamic> location = res[0]['geometry']['location'];
    context.read<HomeBloc>().add(const SetSearchResultsByQueryEvent(query: ''));
    onLocationSelected(location['lat'], location['lng']);
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width - defaultPadding * 2;

    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.searchResults != current.searchResults,
      builder: (BuildContext context, HomeState state) {
        if (state.toShowSuggestions) {
          return Positioned(
            top: Scaffold.of(context).appBarMaxHeight! - 25,
            left: defaultPadding,
            width: _screenWidth,
            height: 300,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(13)),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: state.searchResults.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  title: Text(
                    state.searchResults[index].description,
                  ),
                  onTap: () => _goToLocation(
                    state.searchResults[index].description,
                    context,
                  ),
                ),
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
