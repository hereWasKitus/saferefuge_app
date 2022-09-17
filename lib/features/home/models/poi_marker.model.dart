import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_repository/map_repository.dart';

class POIMarker with ClusterItem {
  final POI poi;

  @override
  LatLng get location => LatLng(poi.latitude, poi.longitude);

  POIMarker({required this.poi});
}
