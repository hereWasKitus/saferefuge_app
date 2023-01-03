part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class LoadCategories extends AppEvent {
  const LoadCategories();

  @override
  List<Object> get props => [];
}

class ChangeSelectedCategoriesIDs extends AppEvent {
  final List<String> ids;

  const ChangeSelectedCategoriesIDs(this.ids);

  @override
  List<Object> get props => [ids];
}

class LoadPOIsByCurrentLocation extends AppEvent {
  final double maxDistance;
  final int skip;

  const LoadPOIsByCurrentLocation({
    this.skip = 0,
    this.maxDistance = 500000,
  });

  @override
  List<Object> get props => [skip, maxDistance];
}

class AppLoadCountries extends AppEvent {
  const AppLoadCountries();

  @override
  List<Object> get props => [];
}
