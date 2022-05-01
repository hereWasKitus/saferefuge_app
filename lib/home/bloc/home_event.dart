part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class SetSearchResultsByQueryEvent extends HomeEvent {
  final String query;

  SetSearchResultsByQueryEvent({required this.query});
}

class SetCategoriesEvent extends HomeEvent {
  final List<Category> categories;

  SetCategoriesEvent({required this.categories});
}

class SetSelectedCategoriesEvent extends HomeEvent {
  final List<String> selectedCategories;

  SetSelectedCategoriesEvent({required this.selectedCategories});
}

class SetPOIsEvent extends HomeEvent {
  final List<POI> pois;

  SetPOIsEvent({required this.pois});
}

class LoadPOIsEvent extends HomeEvent {
  LoadPOIsEvent();
}

class LoadCategoriesEvent extends HomeEvent {
  LoadCategoriesEvent();
}
