import 'package:protect_ua_women/models/poi.model.dart';
import 'package:protect_ua_women/redux/actions.dart';
import 'package:redux/redux.dart';

final poiReducer = combineReducers<List<POI>>([
  TypedReducer<List<POI>, SetPOIsAction>(_setPOIs),
  TypedReducer<List<POI>, GetPOIsAction>(_getPOIs),
]);

List<POI> _setPOIs(List<POI> state, action) {
  return action.pois;
}

List<POI> _getPOIs(List<POI> state, action) {
  return state.where((poi) => poi.id == action.id) as List<POI>;
}
