part of 'app_bloc.dart';

enum CategoriesStatus {
  initial,
  loading,
  success,
  failure,
}

enum POIsStatus {
  initial,
  loading,
  success,
  failure,
}

enum AppStatus {
  initial,
  loading,
  success,
  failure,
}

enum LocationPermissionStatus {
  initial,
  loading,
  granted,
  denied,
}

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(AppStatus.initial) AppStatus appStatus,
    @Default(CategoriesStatus.initial) CategoriesStatus categoriesStatus,
    @Default(POIsStatus.initial) POIsStatus poisStatus,
    @Default(<POICategory>[]) List<POICategory> categories,
    @Default(<String>[]) List<String> selectedCategoriesIDs,
    @Default(<POI>[]) List<POI> pois,
    @Default('') String errorMessage,
    @Default(LocationPermissionStatus.initial)
        LocationPermissionStatus locationPermissionStatus,
    @Default(false) bool poisReachedMaximum,
  }) = _AppState;
}
