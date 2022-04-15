import 'package:protect_ua_women/redux/app_state.dart';
import 'package:protect_ua_women/redux/app_state_reducer.dart';
import 'package:redux/redux.dart';

final Store<AppState> appStore =
    Store<AppState>(appReducer, initialState: const AppState());
