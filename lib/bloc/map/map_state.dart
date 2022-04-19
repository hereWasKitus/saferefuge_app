part of 'map_bloc.dart';

@immutable
class MapState extends Equatable {
  const MapState({
    this.searchResults = const <MapPlace>[],
    this.categories = const <Category>[],
    this.selectedCategories = const <String>[],
    this.pois = const <POI>[],
    this.poisLoaded = false,
  });

  final List<MapPlace> searchResults;
  final List<Category> categories;
  final List<String> selectedCategories;
  final List<POI> pois;
  final bool poisLoaded;

  bool get toShowSuggestions => searchResults.isNotEmpty;

  @override
  List<Object?> get props =>
      [searchResults, categories, selectedCategories, pois, poisLoaded];

  MapState copyWith({
    List<MapPlace>? searchResults,
    List<Category>? categories,
    List<String>? selectedCategories,
    List<POI>? pois,
    bool? poisLoaded,
  }) =>
      MapState(
        searchResults: searchResults ?? this.searchResults,
        categories: categories ?? this.categories,
        selectedCategories: selectedCategories ?? this.selectedCategories,
        pois: pois ?? this.pois,
        poisLoaded: poisLoaded ?? this.poisLoaded,
      );
}
