import 'package:protect_ua_women/redux/app_state.dart';
import 'package:protect_ua_women/redux/reducers/categories_reducer.dart';
import 'package:protect_ua_women/redux/reducers/initialization_reducer.dart';
import 'package:protect_ua_women/redux/reducers/loading_reducer.dart';
import 'package:protect_ua_women/redux/reducers/map_reducer.dart';
import 'package:protect_ua_women/redux/reducers/poi_reducer.dart';
import 'package:protect_ua_women/redux/reducers/registration_form_reducer.dart';
import 'package:protect_ua_women/redux/reducers/search_results_reducer.dart';
import 'package:protect_ua_women/redux/reducers/selected_tags_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    searchQuery: mapReducer(state.searchQuery, action),
    pois: poiReducer(state.pois, action),
    searchResults: searchResultsReducer(
      state.searchResults,
      action,
    ),
    registrationForm: registrationFormReducer(state.registrationForm, action),
    isLoading: loadingReducer(state.isLoading, action),
    isInitialized: initializedReducer(state.isInitialized, action),
    categories: categoriesReducer(state.categories, action),
    selectedTags: selectedTagsReducer(state.selectedTags, action),
  );
}
