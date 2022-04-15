import 'package:flutter/cupertino.dart';
import 'package:protect_ua_women/models/category.model.dart';
import 'package:protect_ua_women/models/map_place.model.dart';
import 'package:protect_ua_women/models/poi.model.dart';
import 'package:protect_ua_women/models/registration_form.model.dart';

@immutable
class AppState {
  final List<String> selectedTags;
  final List<Category> categories;
  final String searchQuery;
  final List<MapPlace> searchResults;
  final RegistrationForm registrationForm;
  final List<POI> pois;
  final bool isLoading;
  final bool isInitialized;

  const AppState({
    this.selectedTags = const <String>[],
    this.categories = const <Category>[],
    this.searchQuery = '',
    this.searchResults = const [],
    this.registrationForm = const RegistrationForm(),
    this.pois = const <POI>[],
    this.isLoading = false,
    this.isInitialized = false,
  });

  AppState copyWith({
    List<String>? selectedTags,
    List<Category>? categories,
    String? searchQuery,
    List<MapPlace>? searchResults,
    RegistrationForm? registrationForm,
    List<POI>? pois,
    bool? isLoading,
    bool? isInitialized,
  }) =>
      AppState(
        selectedTags: selectedTags ?? this.selectedTags,
        categories: categories ?? this.categories,
        searchQuery: searchQuery ?? this.searchQuery,
        searchResults: searchResults ?? this.searchResults,
        registrationForm: registrationForm ?? this.registrationForm,
        pois: pois ?? this.pois,
        isLoading: isLoading ?? this.isLoading,
        isInitialized: isInitialized ?? this.isInitialized,
      );
}
