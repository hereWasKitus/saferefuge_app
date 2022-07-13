part of 'home_bloc.dart';

enum POIStatus {
  initial,
  loading,
  fail,
  succeed,
}

enum SearchStatus {
  initial,
  loading,
  fail,
  succeed,
}

@immutable
class HomeState extends Equatable {
  const HomeState({
    this.searchResults = const <MapPlace>[],
    this.categories = const <Category>[],
    this.selectedCategories = const <String>[],
    this.pois = const <POIMarker>[],
    this.poisLoaded = false,
    this.poiStatus = POIStatus.initial,
    this.searchStatus = SearchStatus.initial,
  });

  final List<MapPlace> searchResults;
  final List<Category> categories;
  final List<String> selectedCategories;
  final List<POIMarker> pois;
  final bool poisLoaded;
  final POIStatus poiStatus;
  final SearchStatus searchStatus;

  bool get toShowSuggestions => searchResults.isNotEmpty;

  HomeState copyWith({
    List<MapPlace>? searchResults,
    List<Category>? categories,
    List<String>? selectedCategories,
    List<POIMarker>? pois,
    bool? poisLoaded,
    POIStatus? poiStatus,
    SearchStatus? searchStatus,
  }) =>
      HomeState(
        searchResults: searchResults ?? this.searchResults,
        categories: categories ?? this.categories,
        selectedCategories: selectedCategories ?? this.selectedCategories,
        pois: pois ?? this.pois,
        poisLoaded: poisLoaded ?? this.poisLoaded,
        poiStatus: poiStatus ?? this.poiStatus,
        searchStatus: searchStatus ?? this.searchStatus,
      );

  @override
  List<Object?> get props => [
        searchResults,
        categories,
        selectedCategories,
        pois,
        poisLoaded,
        poiStatus,
        searchStatus,
      ];
}
