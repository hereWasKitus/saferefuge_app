import 'package:protect_ua_women/redux/actions.dart';
import 'package:redux/redux.dart';

final initializedReducer = combineReducers<bool>([
  TypedReducer<bool, SetInitializedAction>(_setInitialized),
]);

bool _setInitialized(bool state, action) {
  return action.isInitialized;
}
