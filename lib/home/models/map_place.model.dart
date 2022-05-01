class MapPlace {
  final String description;
  final String placeId;

  MapPlace({required this.description, required this.placeId});

  factory MapPlace.fromJson(Map<String, dynamic> json) =>
      MapPlace(description: json['description'], placeId: json['place_id']);
}
