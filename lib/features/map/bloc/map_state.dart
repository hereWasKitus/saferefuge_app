part of 'map_bloc.dart';

enum MapStatus { initial, loading }

class MapState extends Equatable {
  const MapState({
    this.cameraPosition = const CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 15,
    ),
    this.suggestionList = const [],
    this.searchValue = '',
    this.markers = const {},
    this.cameraSet = false,
    this.status = MapStatus.initial,
    this.controller,
  });

  final CameraPosition cameraPosition;
  final List<MapLocation> suggestionList;
  final String searchValue;
  final Set<Marker> markers;
  final bool cameraSet;
  final MapStatus status;
  final GoogleMapController? controller;

  get displaySuggestions => suggestionList.isNotEmpty;

  MapState copyWith({
    CameraPosition? cameraPosition,
    List<MapLocation>? suggestionList,
    String? searchValue,
    Set<Marker>? markers,
    bool? cameraSet,
    MapStatus? status,
    GoogleMapController? controller,
  }) =>
      MapState(
        cameraPosition: cameraPosition ?? this.cameraPosition,
        suggestionList: suggestionList ?? this.suggestionList,
        searchValue: searchValue ?? this.searchValue,
        markers: markers ?? this.markers,
        cameraSet: cameraSet ?? this.cameraSet,
        status: status ?? this.status,
        controller: controller ?? this.controller,
      );

  @override
  List<Object?> get props => [
        cameraPosition,
        suggestionList,
        searchValue,
        markers,
        cameraSet,
        status,
        controller,
      ];
}
