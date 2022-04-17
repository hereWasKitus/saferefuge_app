part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class SetSearchResultsByQueryEvent extends MapEvent {
  final String query;

  SetSearchResultsByQueryEvent({required this.query});
}

class SetCategoriesEvent extends MapEvent {
  final List<Category> categories;

  SetCategoriesEvent({required this.categories});
}

class SetSelectedCategoriesEvent extends MapEvent {
  final List<String> selectedCategories;

  SetSelectedCategoriesEvent({required this.selectedCategories});
}

class SetPOIsEvent extends MapEvent {
  final List<POI> pois;

  SetPOIsEvent({required this.pois});
}

class LoadPOIsEvent extends MapEvent {
  LoadPOIsEvent();
}

class LoadCategoriesEvent extends MapEvent {
  LoadCategoriesEvent();
}
