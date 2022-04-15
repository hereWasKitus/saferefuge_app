import 'package:protect_ua_women/models/map_place.model.dart';
import 'package:protect_ua_women/redux/actions.dart';
import 'package:redux/redux.dart';

final searchResultsReducer = combineReducers<List<MapPlace>>([
  TypedReducer<List<MapPlace>, SetSearchResultsAction>(_setSearchResults),
]);

List<MapPlace> _setSearchResults(
  List<MapPlace> state,
  SetSearchResultsAction action,
) {
  return action.searchResults;
}
