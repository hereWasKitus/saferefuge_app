import 'package:protect_ua_women/redux/actions.dart';
import 'package:protect_ua_women/redux/app_state.dart';

AppSate reducer(AppSate state, dynamic action) {
  switch (action) {
    case AppActions.setSearchQuery:
      return AppSate(searchQuery: action.searchQuery);
    default:
      return state;
  }
}
