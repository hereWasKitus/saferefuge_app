import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:protect_ua_women/bloc/map/map_bloc.dart';
import 'package:protect_ua_women/config/constants.dart';
import 'package:protect_ua_women/screens/home/components/map.dart';
import 'package:protect_ua_women/screens/home/components/map_search_field.dart';
import 'package:protect_ua_women/screens/home/components/categories_list.dart';
import 'package:protect_ua_women/screens/home/components/menu_button.dart';
import 'package:protect_ua_women/screens/home/components/suggestions_list.dart';

typedef SetSearchQueryCallback = void Function(String query);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final CameraPosition _kGooglePlex = const CameraPosition(
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
        // automaticallyImplyLeading: false,
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
              onPressed: () => AutoRouter.of(context).pushNamed('/authorization'),
            ),
          ),
        ],
        bottom: const PreferredSize(
          child: CategoriesList(),
          preferredSize: Size.fromHeight(32),
        ),
      ),
      body: Stack(
        children: [
          BlocBuilder<MapBloc, MapState>(
            builder: (context, state) {
              return MapMain(
                defaultCameraPosition: _kGooglePlex,
                controllerCompleter: _controller,
                pois: state.pois,
              );
            },
          ),
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
    CameraPosition position = CameraPosition(target: LatLng(lat, lng), zoom: 12.0);
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

    final Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 15);
  }
}
