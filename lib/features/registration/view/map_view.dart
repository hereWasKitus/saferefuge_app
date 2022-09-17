import 'dart:async';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:protect_ua_women/core/config/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MapView extends StatefulWidget {
  const MapView({Key? key, required this.onAddressFound}) : super(key: key);

  final void Function(Map<String, dynamic>, LatLng) onAddressFound;

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controllerCompleter = Completer();
  late CameraPosition _initialPosition;
  bool _initialPositionLoaded = false;
  Set<Marker> _markers = {};

  @override
  void initState() {
    _getCurrentLocation().then((LatLng currentPosition) {
      setState(() {
        _initialPosition = CameraPosition(target: currentPosition, zoom: 13);
        _initialPositionLoaded = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          _mapWidget(),
          _buttonGroupWidget(),
        ],
      ),
    );
  }

  Widget _mapWidget() {
    if (!_initialPositionLoaded) {
      return const Center(
        child: SpinKitCircle(color: primaryColor),
      );
    } else {
      return GoogleMap(
        markers: _markers,
        initialCameraPosition: _initialPosition,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          if (!_controllerCompleter.isCompleted) {
            _controllerCompleter.complete(controller);
          }
        },
        zoomControlsEnabled: false,
        compassEnabled: false,
        mapToolbarEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        onTap: _setPoint,
      );
    }
  }

  Widget _buttonGroupWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_markers.isEmpty)
          ElevatedButton(
            onPressed: () {
              AutoRouter.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(defaultBorderRadius),
                ),
              ),
              primary: const Color.fromRGBO(27, 50, 132, 1),
            ),
            child: const Text('Back'),
          )
        else
          ElevatedButton(
            onPressed: () async {
              Map<String, dynamic>? address = await _getAddressByLatLng(_markers.first.position);

              if (address != null) {
                widget.onAddressFound(address, _markers.first.position);
                AutoRouter.of(context).pop();
              }
            },
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(defaultBorderRadius),
                ),
              ),
              primary: const Color.fromRGBO(27, 50, 132, 1),
            ),
            child: const Text('Set address'),
          ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () async {
            Map<String, dynamic>? address = await _getAddressByLatLng(_initialPosition.target);

            if (address != null) {
              widget.onAddressFound(address, _initialPosition.target);
              AutoRouter.of(context).pop();
            }
          },
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(defaultBorderRadius),
              ),
            ),
            primary: const Color.fromRGBO(27, 50, 132, 1),
          ),
          child: const Text('Use current location'),
        )
      ],
    );
  }

  Future<LatLng> _getCurrentLocation() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    final Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    return LatLng(position.latitude, position.longitude);
  }

  _setPoint(LatLng position) async {
    BitmapDescriptor icon = await _getMarkerBitmap();
    setState(() {
      _markers = {
        Marker(
          markerId: const MarkerId('1'),
          position: position,
          icon: icon,
          onTap: () {
            setState(() {
              _markers = {};
            });
          },
        )
      };
    });
  }

  Future<BitmapDescriptor> _getMarkerBitmap() async {
    const size = 40;
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = primaryColor;
    final Paint paint2 = Paint()..color = const Color.fromRGBO(71, 66, 221, 0.7);

    canvas.drawCircle(const Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(const Offset(size / 2, size / 2), size / 2.2, paint2);
    canvas.drawCircle(const Offset(size / 2, size / 2), size / 2.8, paint1);

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }

  Future<Map<String, dynamic>?> _getAddressByLatLng(LatLng latLng) async {
    String query =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${latLng.latitude},${latLng.longitude}&key=${dotenv.env['GOOGLE_MAP_API_KEY']}';
    var res = await http.get(Uri.parse(query));
    var json = convert.jsonDecode(res.body) as Map;

    if (json['status'] == 'ZERO_RESULTS') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No results, try another point'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: primaryColor,
        ),
      );
      return null;
    } else if (json['status'] == 'OVER_QUERY_LIMIT') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Query limit is over'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: primaryColor,
        ),
      );
      return null;
    } else if (json['status'] == 'UNKNOWN_ERROR') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Server error, try again'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: primaryColor,
        ),
      );
      return null;
    }

    return json['results'][0];
    // return json['results'][0]['address_components']; find component that contains both types: 'political', 'locality' to detect the city and find type 'country' for country
  }
}
