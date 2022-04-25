import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class POI with ClusterItem {
  String id;
  String? address;
  String? phone;
  String? email;
  String? url;
  String? city;
  String? country;
  String name;
  String? description;
  List? categories;
  List? organisations;
  LatLng latLng;

  POI({
    required this.id,
    this.address = '',
    this.city = '',
    this.phone = '',
    this.email = '',
    this.url = '',
    this.country = '',
    required this.latLng,
    required this.name,
    this.description = '',
    this.categories = const [],
    this.organisations = const [],
  });

  @override
  LatLng get location => latLng;

  factory POI.fromJSON(Map<String, dynamic> json) => POI(
        latLng: LatLng(json['geo']['coordinates'][1], json['geo']['coordinates'][0]),
        id: json['_id'],
        city: json['city'],
        address: json['address'],
        name: json['name'],
        description: json['description'],
        categories: json['categories'],
        organisations: json['organisations'],
        country: json['country'],
      );

  bool containsCategories(List<String> categories) {
    bool contains = false;

    for (var cat in categories) {
      if (contains) {
        break;
      }

      if (this.categories!.contains(cat)) {
        contains = true;
      }
    }

    return contains;
  }
}
