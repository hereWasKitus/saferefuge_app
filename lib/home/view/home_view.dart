import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:protect_ua_women/config/constants.dart';

import '../home.dart';

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
        bottom: const PreferredSize(
          child: CategoriesList(),
          preferredSize: Size.fromHeight(32),
        ),
      ),
      body: Stack(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
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
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocConsumer<HomeBloc, HomeState>(
            listener: (previous, current) {
              if (current.poiStatus == POIStatus.fail) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Failed to load poins on map. Click on refresh button to try again'),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: red,
                  ),
                );
              }
            },
            listenWhen: (previous, current) => previous.poiStatus != current.poiStatus,
            buildWhen: (previous, current) => previous.poiStatus != current.poiStatus,
            builder: (context, state) {
              return FloatingActionButton.small(
                heroTag: 'btn1',
                onPressed: () {
                  context.read<HomeBloc>().add(LoadPOIsEvent());
                },
                backgroundColor: primaryColor,
                child: state.poiStatus != POIStatus.loading
                    ? const Icon(Icons.refresh)
                    : const SpinKitDualRing(
                        color: Colors.white,
                        size: 20,
                        lineWidth: 2,
                      ),
              );
            },
          ),
          FloatingActionButton.small(
            heroTag: 'btn2',
            onPressed: _goToMyLocation,
            backgroundColor: primaryColor,
            child: SvgPicture.asset("assets/icons/location-arrow.svg"),
          ),
        ],
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
