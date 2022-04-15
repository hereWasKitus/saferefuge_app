import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:protect_ua_women/constants.dart';
import 'package:protect_ua_women/models/poi.model.dart';
import 'package:protect_ua_women/screens/home/components/map.dart';
import 'package:protect_ua_women/screens/home/components/map_search_field.dart';
import 'package:protect_ua_women/screens/home/components/positioned_tags_list.dart';
import 'package:protect_ua_women/screens/home/components/menu_button.dart';
import 'package:protect_ua_women/screens/home/components/suggestions_list.dart';

import '../../redux/app_state.dart';

typedef SetSearchQueryCallback = void Function(String query);

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
          child: MapSearchField(
            onSubmit: _goToPosition,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: MenuButton(
              onPressed: () =>
                  AutoRouter.of(context).pushNamed('/authorization'),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          StoreConnector<AppState, List<POI>>(
            converter: (store) {
              return store.state.selectedTags.isEmpty
                  ? store.state.pois
                  : store.state.pois
                      .where((poi) =>
                          poi.containsCategories(store.state.selectedTags))
                      .toList();
            },
            builder: (BuildContext context, List<POI> pois) {
              return MapMain(
                defaultCameraPosition: _kGooglePlex,
                controllerCompleter: _controller,
                pois: pois,
              );
            },
          ),
          const PositionedTagsList(),
          SuggestionsList(onLocationSelected: _goToPosition)
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: _goToMyLocation,
        backgroundColor: primaryColor,
        child: SvgPicture.asset("assets/icons/location-arrow.svg"),
      ),
      extendBodyBehindAppBar: true,
    );
  }

  Future<void> _goToMyLocation() async {
    CameraPosition myPosition = await _determinePosition();
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(myPosition));
  }

  _goToPosition(double lat, double lng) async {
    CameraPosition position =
        CameraPosition(target: LatLng(lat, lng), zoom: 11);
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(position));
  }

  Future<CameraPosition> _determinePosition() async {
    // bool serviceEnabled;
    // LocationPermission permission;

    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   return Future.error('Location services are disabled.');
    // }

    // permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();
    //   if (permission == LocationPermission.denied) {
    //     return Future.error('Location permissions are denied');
    //   }
    // }

    // if (permission == LocationPermission.deniedForever) {
    //   return Future.error(
    //       'Location permissions are permanently denied, we cannot request permissions.');
    // }

    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 15);
  }
}
