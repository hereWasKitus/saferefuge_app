import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protect_ua_women/core/config/constants.dart';

import '../map.dart';

class MapSuggestionsList extends StatefulWidget {
  const MapSuggestionsList({Key? key}) : super(key: key);

  @override
  State<MapSuggestionsList> createState() => _MapSuggestionsListState();
}

class _MapSuggestionsListState extends State<MapSuggestionsList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      buildWhen: (previous, current) => previous.suggestionList != current.suggestionList,
      builder: (context, state) {
        if (!state.displaySuggestions) {
          return const SizedBox.shrink();
        }

        return Positioned(
          top: 85,
          left: defaultPadding,
          width: MediaQuery.of(context).size.width - defaultPadding * 2,
          height: 300,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(13)),
            ),
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: state.suggestionList.length,
              itemBuilder: (BuildContext context, int index) => ListTile(
                title: Text(
                  state.suggestionList[index].description,
                ),
                onTap: () => _handleTap(state.suggestionList[index]),
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleTap(MapLocation suggestion) {
    context.read<MapBloc>().add(MapSuggestionSelected(suggestion.description));
  }
}
