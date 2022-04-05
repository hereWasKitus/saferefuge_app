import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:protect_ua_women/constants.dart';
import 'package:protect_ua_women/redux/actions.dart';
import 'package:protect_ua_women/redux/app_state.dart';
import 'package:protect_ua_women/screens/home/components/positioned_tags_list.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: _defaultCameraZoom,
  );

  static const double _defaultCameraZoom = 15;

  @override
  void initState() {
    super.initState();
  }

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
          child: StoreConnector<AppSate, VoidCallback>(
            converter: (store) =>
                () => store.dispatch(AppActions.setSearchQuery),
            builder: (context, setSearchQuery) =>
                const CupertinoSearchTextField(
              placeholder: 'Enter destination',
              backgroundColor: bgColor,
              borderRadius: BorderRadius.all(Radius.circular(13)),
              padding: EdgeInsets.all(12),
              prefixInsets: EdgeInsetsDirectional.only(start: 12),
              itemColor: primaryColor,
              placeholderStyle:
                  TextStyle(color: Color.fromRGBO(27, 50, 132, 0.2)),
            ),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Ink(
              decoration: const ShapeDecoration(
                color: primaryColor,
                shape: CircleBorder(),
              ),
              child: IconButton(
                  splashRadius: 23,
                  onPressed: () => {},
                  icon: const Icon(Icons.menu),
                  color: Colors.white),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              _goToMyLocation();
            },
            zoomControlsEnabled: false,
            compassEnabled: false,
          ),
          const PositionedTagsList()
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

  Future<CameraPosition> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final Position position = await Geolocator.getCurrentPosition();
    return CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: _defaultCameraZoom);
  }
}
