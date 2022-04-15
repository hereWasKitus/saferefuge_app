import 'package:protect_ua_women/redux/actions.dart';
import 'package:redux/redux.dart';

final mapReducer = combineReducers<String>([
  TypedReducer<String, SetSearchQueryAction>(_setSearchQuery),
]);

String _setSearchQuery(String state, action) {
  return action.query;
}
