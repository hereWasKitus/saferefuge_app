import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:protect_ua_women/config/constants.dart';

import '../map.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final double _defaultZoomLevel = 14.5;
  late GoogleMapController _controller;
  final Completer<GoogleMapController> _completer = Completer();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapBloc, MapState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (!state.cameraSet) {
          return const Center(
            child: SpinKitCircle(color: primaryColor),
          );
        }

        return GoogleMap(
          initialCameraPosition: state.cameraPosition,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          myLocationEnabled: true,
          mapToolbarEnabled: false,
          onTap: (latLng) => _handleTap(latLng, context),
          markers: state.markers,
          onMapCreated: (GoogleMapController controller) {
            if (!_completer.isCompleted) {
              _completer.complete(controller);
            }

            // _manager.setMapId(controller.mapId);

            setState(() {
              _controller = controller;
              context.read<MapBloc>().add(MapControllerCreated(controller));
            });
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _setInitialCameraPosition();
  }

  void _handleTap(LatLng latlng, BuildContext context) async {
    // final BitmapDescriptor icon = await _bitmapDescriptorFromSvgAsset(context, 'assetName');
    final Marker marker = Marker(
      markerId: const MarkerId('1'),
      icon: await _bitmapDescriptorFromSvgAsset(
          context, 'assets/icons/location_marker.svg'),
      position: latlng,
    );

    context.read<MapBloc>().add(MapMarkersChanged({marker}));
  }

  Future<BitmapDescriptor> _bitmapDescriptorFromSvgAsset(
      BuildContext context, String assetName) async {
    // Read SVG file as String
    String svgString =
        await DefaultAssetBundle.of(context).loadString(assetName);
    // Create DrawableRoot from SVG String
    DrawableRoot svgDrawableRoot = await svg.fromSvgString(svgString, '1');

    // toPicture() and toImage() don't seem to be pixel ratio aware, so we calculate the actual sizes here
    MediaQueryData queryData = MediaQuery.of(context);
    double devicePixelRatio = queryData.devicePixelRatio;
    double width =
        32 * devicePixelRatio; // where 32 is your SVG's original width
    double height = 32 * devicePixelRatio; // same thing

    // Convert to ui.Picture
    ui.Picture picture = svgDrawableRoot.toPicture(size: Size(width, height));

    // Convert to ui.Image. toImage() takes width and height as parameters
    // you need to find the best size to suit your needs and take into account the
    // screen DPI
    ui.Image image = await picture.toImage(width.toInt(), height.toInt());
    ByteData? bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());
  }

  Future<Position> _getCurrentPosition() async {
    // bool serviceEnabled;
    LocationPermission permission;

    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   return Future.error('Location services are disabled.');
    // }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      // if (permission == LocationPermission.denied) {
      //   return Future.error('Location permissions are denied');
      // }
    }

    // if (permission == LocationPermission.deniedForever) {
    //   return Future.error(
    //       'Location permissions are permanently denied, we cannot request permissions.');
    // }

    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  void _setInitialCameraPosition() async {
    CameraPosition fallbackCameraPosition = CameraPosition(
      target: const LatLng(37.42796133580664, -122.085749655962),
      zoom: _defaultZoomLevel,
    );

    try {
      Position currentPosition = await _getCurrentPosition();
      context.read<MapBloc>().add(
            MapCameraPositionChanged(
              CameraPosition(
                target:
                    LatLng(currentPosition.latitude, currentPosition.longitude),
                zoom: _defaultZoomLevel,
              ),
            ),
          );
    } catch (e) {
      context
          .read<MapBloc>()
          .add(MapCameraPositionChanged(fallbackCameraPosition));
    }
  }
}
