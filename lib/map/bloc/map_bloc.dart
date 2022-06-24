import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_repository/map_repository.dart';

import '../map.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc({required MapRepository repository})
      : _mapRepository = repository,
        super(const MapState()) {
    on<MapSearchFieldChanged>(_onSearchFieldChanged);
    on<MapCameraPositionChanged>(_onCameraPositionChanged);
    on<MapMarkersChanged>(_onMarkersChanged);
    on<MapControllerCreated>(_onControllerCreated);
    on<MapSuggestionSelected>(_onSuggestionSelected);
    on<MapStatusChanged>(_onStatusChanged);
  }

  late final MapRepository _mapRepository;

  _onSearchFieldChanged(
      MapSearchFieldChanged event, Emitter<MapState> emit) async {
    if (event.value.isEmpty) {
      emit(state.copyWith(suggestionList: []));
      return;
    }

    emit(state.copyWith(status: MapStatus.loading));

    try {
      List result = await _mapRepository.autocomplete(event.value);
      List<MapLocation> suggestions =
          result.map((item) => MapLocation.fromJson(item)).toList();
      emit(state.copyWith(suggestionList: suggestions));
    } catch (e) {
      print(e);
    } finally {
      emit(state.copyWith(status: MapStatus.initial));
    }
  }

  _onCameraPositionChanged(
      MapCameraPositionChanged event, Emitter<MapState> emit) {
    emit(state.copyWith(cameraPosition: event.cameraPosition, cameraSet: true));
  }

  _onMarkersChanged(MapMarkersChanged event, Emitter<MapState> emit) {
    emit(state.copyWith(markers: event.markers));
  }

  _onControllerCreated(MapControllerCreated event, Emitter<MapState> emit) {
    emit(state.copyWith(controller: event.controller));
  }

  _onSuggestionSelected(
      MapSuggestionSelected event, Emitter<MapState> emit) async {
    emit(state.copyWith(status: MapStatus.loading));

    try {
      var response = await _mapRepository.searchPlaces(event.suggestion);
      Map<String, dynamic> location =
          response['candidates'][0]['geometry']['location'];
      emit(state.copyWith(suggestionList: []));
      state.controller!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(location['lat'], location['lng']),
            zoom: 14.5,
          ),
        ),
      );
    } catch (e) {
      print(e);
    } finally {
      emit(state.copyWith(status: MapStatus.initial));
    }
  }

  _onStatusChanged(MapStatusChanged event, Emitter<MapState> emit) {
    emit(state.copyWith(status: event.status));
  }
}
