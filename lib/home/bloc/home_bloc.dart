import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:map_repository/map_repository.dart';
import 'package:meta/meta.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import '../../config/secrets.dart';
import '../models/models.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required MapRepository mapRepository})
      : _mapRepository = mapRepository,
        super(const HomeState()) {
    on<SetSearchResultsByQueryEvent>(_setSearchResults);
    on<SetCategoriesEvent>(_setCategories);
    on<SetSelectedCategoriesEvent>(_setSelectedCategories);
    on<LoadPOIsEvent>(_loadPOIs);
    on<LoadCategoriesEvent>(_loadCategories);
    on<LoadNearbyPOIsEvent>(_loadNearbyPOIs);
    on<HomeSetSearchStatusEvent>(_setSearchStatus);
    on<HomeSetSearchQuery>(_setSearchQuery);
  }

  final MapRepository _mapRepository;

  Future<void> _setSearchResults(SetSearchResultsByQueryEvent event, Emitter<HomeState> emit) async {
    if (event.query.isEmpty) {
      emit(state.copyWith(searchResults: []));
      return;
    }

    Uri url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${event.query}&key=$googleMapAPIkey');
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var results = json['predictions'] as List;
    var places = results.map((place) => MapPlace.fromJson(place)).toList();
    emit(state.copyWith(searchResults: places));
  }

  _setCategories(SetCategoriesEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(categories: event.categories));
  }

  _setSelectedCategories(SetSelectedCategoriesEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedCategories: event.selectedCategories));
  }

  Future<void> _loadPOIs(LoadPOIsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(poiStatus: POIStatus.loading));

    try {
      List<POI> pois = await _mapRepository.getPOIs();
      List<POIMarker> poiMarkers = pois.map((poi) => POIMarker(poi: poi)).toList();
      emit(state.copyWith(pois: poiMarkers, poiStatus: POIStatus.succeed));
    } catch (e) {
      emit(state.copyWith(poiStatus: POIStatus.fail));
    }
  }

  Future<void> _loadNearbyPOIs(LoadNearbyPOIsEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(poiStatus: POIStatus.loading));

    try {
      List<POI> pois =
          await _mapRepository.getNearbyPOIs(lat: event.lat, lng: event.lng, maxDistance: event.maxDistance);
      List<POIMarker> poiMarkers = pois.map((poi) => POIMarker(poi: poi)).toList();
      emit(state.copyWith(pois: [...state.pois, ...poiMarkers], poiStatus: POIStatus.succeed));
    } catch (e) {
      emit(state.copyWith(poiStatus: POIStatus.fail));
    }
  }

  Future<void> _loadCategories(LoadCategoriesEvent event, Emitter<HomeState> emit) async {
    List<Category> categories = await _mapRepository.getCategories();
    emit(state.copyWith(categories: categories));
  }

  void _setSearchStatus(HomeSetSearchStatusEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(searchStatus: event.status));
  }

  void _setSearchQuery(HomeSetSearchQuery event, Emitter<HomeState> emit) {
    emit(state.copyWith(searchQuery: event.query));
  }
}
