import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_repository/map_repository.dart';
import 'package:protect_ua_women/config/constants.dart';

import '../map.dart';

// TODO:
// 1. Map bottom as widget (pass context to allow use map bloc)
// 2. Replace map bottom widget with Scaffold persistentFooter
class MapScreen extends StatefulWidget {
  const MapScreen({
    Key? key,
    required this.onPointSelected,
    // this.bottomWidgetsBuilder,
  }) : super(key: key);

  // final Function<Widget>(MapBloc bloc)? bottomWidgetsBuilder;
  final void Function(Map<String, dynamic>, BuildContext) onPointSelected;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapBloc(repository: context.read<MapRepository>()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            leadingWidth: 44 + 12,
            leading: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Ink(
                decoration: const ShapeDecoration(
                  color: primaryColor,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  splashRadius: 23,
                  onPressed: () {
                    AutoRouter.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.white,
                ),
              ),
            ),
            automaticallyImplyLeading: false,
            title: const MapSearchBar(),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.transparent,
            elevation: 0,
          ),
          extendBodyBehindAppBar: true,
          extendBody: true,
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              const MapWidget(),
              const MapSuggestionsList(),
              MapBottom(
                onButtonClicked: () {
                  _handleButtonClick(context);
                },
              ),
              // widget.bottomWidgetsBuilder(bloc)
            ],
          ),
        );
      }),
    );
  }

  void _handleButtonClick(BuildContext context) async {
    LatLng location = context.read<MapBloc>().state.markers.first.position;

    try {
      context.read<MapBloc>().add(const MapStatusChanged(MapStatus.loading));

      var response = await context.read<MapRepository>().getAddressByLocation(location.latitude, location.longitude);

      widget.onPointSelected(response['results'][0], context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Try other point'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: red,
        ),
      );
      // print(e);
    } finally {
      context.read<MapBloc>().add(const MapStatusChanged(MapStatus.initial));
    }
  }
}
