part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class MapSearchFieldChanged extends MapEvent {
  final String value;

  const MapSearchFieldChanged(this.value);

  @override
  List<Object> get props => [value];
}

class MapCameraPositionChanged extends MapEvent {
  final CameraPosition cameraPosition;

  const MapCameraPositionChanged(this.cameraPosition);

  @override
  List<Object> get props => [cameraPosition];
}

class MapMarkersChanged extends MapEvent {
  final Set<Marker> markers;

  const MapMarkersChanged(this.markers);

  @override
  List<Object> get props => [markers];
}

class MapControllerCreated extends MapEvent {
  final GoogleMapController controller;

  const MapControllerCreated(this.controller);

  @override
  List<Object> get props => [controller];
}

class MapSuggestionSelected extends MapEvent {
  final String suggestion;

  const MapSuggestionSelected(this.suggestion);

  @override
  List<Object> get props => [suggestion];
}

class MapStatusChanged extends MapEvent {
  final MapStatus status;

  const MapStatusChanged(this.status);

  @override
  List<Object> get props => [status];
}
