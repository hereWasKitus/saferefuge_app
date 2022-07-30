part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SetSearchResultsByQueryEvent extends HomeEvent {
  final String query;

  const SetSearchResultsByQueryEvent({required this.query});

  @override
  List<Object> get props => [query];
}

class SetCategoriesEvent extends HomeEvent {
  final List<Category> categories;

  const SetCategoriesEvent({required this.categories});

  @override
  List<Object> get props => [categories];
}

class SetSelectedCategoriesEvent extends HomeEvent {
  final List<String> selectedCategories;

  const SetSelectedCategoriesEvent({required this.selectedCategories});

  @override
  List<Object> get props => [selectedCategories];
}

class LoadPOIsEvent extends HomeEvent {
  const LoadPOIsEvent();

  @override
  List<Object> get props => [];
}

class LoadNearbyPOIsEvent extends HomeEvent {
  final double lat;
  final double lng;
  final int limit;
  final double maxDistance;

  const LoadNearbyPOIsEvent({
    required this.lat,
    required this.lng,
    this.limit = 3000,
    this.maxDistance = 500000,
  });

  @override
  List<Object> get props => [lat, lng, limit, maxDistance];
}

class LoadCategoriesEvent extends HomeEvent {
  const LoadCategoriesEvent();

  @override
  List<Object> get props => [];
}

class HomeSetSearchStatusEvent extends HomeEvent {
  final SearchStatus status;

  const HomeSetSearchStatusEvent({required this.status});

  @override
  List<Object> get props => [status];
}

class HomeSetSearchQuery extends HomeEvent {
  final String query;

  const HomeSetSearchQuery(this.query);

  @override
  List<Object> get props => [query];
}
