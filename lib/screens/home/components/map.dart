import 'dart:async';
import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:protect_ua_women/constants.dart';
import 'package:protect_ua_women/models/poi.model.dart';
import 'package:protect_ua_women/redux/store.dart';
import 'package:protect_ua_women/routes/router.gr.dart';

class MapMain extends StatefulWidget {
  CameraPosition defaultCameraPosition;
  Completer<GoogleMapController> controllerCompleter;
  List<POI> pois;

  MapMain({
    Key? key,
    required this.defaultCameraPosition,
    required this.controllerCompleter,
    required this.pois,
  }) : super(key: key);

  @override
  State<MapMain> createState() => _MapState();
}

class _MapState extends State<MapMain> {
  static const double _defaultCameraZoom = 15;
  Set<Marker> _markers = {};
  late ClusterManager _manager;
  late GoogleMapController _controller;

  @override
  void initState() {
    _manager = _initClusterManager();
    super.initState();
    goToMyLocation();
  }

  ClusterManager _initClusterManager() {
    return ClusterManager<POI>(
      widget.pois,
      _updateMarkers,
      markerBuilder: _markerBuilder,
    );
  }

  void _updateMarkers(Set<Marker> markers) {
    setState(() {
      _markers = markers;
    });
  }

  Future<void> goToMyLocation() async {
    LatLng myPosition = await determinePosition();
    CameraPosition camera =
        CameraPosition(target: myPosition, zoom: _defaultCameraZoom);
    final GoogleMapController controller =
        await widget.controllerCompleter.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(camera));
  }

  goToPosition(double lat, double lng) async {
    CameraPosition position =
        CameraPosition(target: LatLng(lat, lng), zoom: 12);
    final GoogleMapController controller =
        await widget.controllerCompleter.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(position));
  }

  Future<LatLng> determinePosition() async {
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
    return LatLng(position.latitude, position.longitude);
  }

  Future<void> _zoomToCluster(Cluster<POI> cluster) async {
    var zoomLevel = await _controller.getZoomLevel();
    _controller.animateCamera(
      CameraUpdate.newLatLngZoom(cluster.location, zoomLevel + 2.2),
    );
  }

  Future<Marker> Function(Cluster<POI>) get _markerBuilder => (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          icon: await _getMarkerBitmap(cluster.isMultiple ? 125 : 75,
              text: cluster.isMultiple ? cluster.count.toString() : null),
          onTap: () async {
            if (cluster.items.length > 5) {
              _zoomToCluster(cluster);
            } else {
              LatLng myPosition = await determinePosition();
              AutoRouter.of(context).push(OrganizationListScreen(
                pois: cluster.items.toList(),
                currentPosition: myPosition,
              ));
            }
          },
        );
      };

  Future<BitmapDescriptor> _getMarkerBitmap(int size, {String? text}) async {
    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint1 = Paint()..color = primaryColor;
    final Paint paint2 = Paint()
      ..color = const Color.fromRGBO(71, 66, 221, 0.7);

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(
            fontSize: size / 3,
            color: Colors.white,
            fontWeight: FontWeight.normal),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }

    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }

  /**
   * 1. Somehow listen to app state change from the outside(try to react only to specific fields of state)
   * 2. Create listener here that will call _initClusterManager() to recreate clusters
   */

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      markers: Set.from(_markers),
      initialCameraPosition: widget.defaultCameraPosition,
      onMapCreated: (GoogleMapController controller) {
        widget.controllerCompleter.complete(controller);
        _manager.setMapId(controller.mapId);
        setState(() {
          _controller = controller;
        });
      },
      zoomControlsEnabled: false,
      compassEnabled: false,
      mapToolbarEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      onCameraMove: _manager.onCameraMove,
      onCameraIdle: _manager.updateMap,
    );
  }
}
