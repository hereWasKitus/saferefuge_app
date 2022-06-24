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

class LoadPOIsEvent extends HomeEvent {
  LoadPOIsEvent();
}

class LoadNearbyPOIsEvent extends HomeEvent {
  final double lat;
  final double lng;
  final int? limit;
  final double? maxDistance;

  LoadNearbyPOIsEvent({required this.lat, required this.lng, this.limit, this.maxDistance});
}

class LoadCategoriesEvent extends HomeEvent {
  LoadCategoriesEvent();
}
