class MapLocation {
  final String description;
  final String placeId;

  MapLocation({required this.description, required this.placeId});

  factory MapLocation.fromJson(Map<String, dynamic> json) =>
      MapLocation(description: json['description'], placeId: json['place_id']);
}
