import 'package:protect_ua_women/models/category.model.dart';
import 'package:protect_ua_women/models/map_place.model.dart';
import 'package:protect_ua_women/models/poi.model.dart';
import 'package:protect_ua_women/models/registration_form.model.dart';

class SetMapFiltersAction {
  List<String>? filters;

  SetMapFiltersAction({this.filters});

  @override
  String toString() {
    return 'SetMapFiltersAction{filters: $filters}';
  }
}

class SetSearchQueryAction {
  String query;

  SetSearchQueryAction(this.query);

  @override
  String toString() {
    return 'SetSearchQueryAction{query: $query}';
  }
}

class SetSearchResultsAction {
  List<MapPlace> searchResults;

  SetSearchResultsAction(this.searchResults);

  @override
  String toString() {
    return 'SetSearchQueryAction{searchResults: $searchResults}';
  }
}

class SetRegistrationFormAction {
  RegistrationForm registrationForm;

  SetRegistrationFormAction(this.registrationForm);

  @override
  String toString() {
    return 'SetRegistrationFormAction{registrationForm: $registrationForm}';
  }
}

class SetPOIsAction {
  List<POI> pois;

  SetPOIsAction(this.pois);

  @override
  String toString() {
    return 'SetPOIsAction{pois: $pois}';
  }
}

class GetPOIsAction {
  List<String> id;

  GetPOIsAction(this.id);

  @override
  String toString() {
    return 'GetPOIAction{pois: $id}';
  }
}

class SetLoadingAction {
  bool isLoading;

  SetLoadingAction(this.isLoading);

  @override
  String toString() {
    return 'SetLoadingAction{isLoading: $isLoading}';
  }
}

class SetInitializedAction {
  bool isInitialized;

  SetInitializedAction(this.isInitialized);

  @override
  String toString() {
    return 'SetLoadingAction{isInitialized: $isInitialized}';
  }
}

class SetCategoriesAction {
  List<Category> categories;

  SetCategoriesAction(this.categories);

  @override
  String toString() {
    return 'SetCategoriesAction{categories: $categories}';
  }
}

class SetSelectedTagsAction {
  List<String> selectedTags;

  SetSelectedTagsAction(this.selectedTags);

  @override
  String toString() {
    return 'SetSelectedTagsAction{selectedTags: $selectedTags}';
  }
}
