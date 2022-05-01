import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:protect_ua_women/services/map.service.dart';

import '../../config/secrets.dart';
import '../models/models.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<SetSearchResultsByQueryEvent>(_setSearchResults);
    on<SetCategoriesEvent>(_setCategories);
    on<SetSelectedCategoriesEvent>(_setSelectedCategories);
    on<SetPOIsEvent>(_setPOIs);
    on<LoadPOIsEvent>(_loadPOIs);
    on<LoadCategoriesEvent>(_loadCategories);
  }

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

  _setPOIs(SetPOIsEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(pois: event.pois));
  }

  Future<void> _loadPOIs(LoadPOIsEvent event, Emitter<HomeState> emit) async {
    List<POI> pois = await MapService().fetchPOIs();
    emit(state.copyWith(pois: pois, poisLoaded: true));
  }

  Future<void> _loadCategories(LoadCategoriesEvent event, Emitter<HomeState> emit) async {
    List<Category> categories = await MapService().fetchCategories();
    emit(state.copyWith(categories: categories));
  }
}
