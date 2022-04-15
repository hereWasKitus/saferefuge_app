import 'package:protect_ua_women/redux/actions.dart';
import 'package:redux/redux.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, SetLoadingAction>(_setLoading),
]);

bool _setLoading(bool state, action) {
  return action.isLoading;
}
