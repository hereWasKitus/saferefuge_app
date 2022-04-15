import 'package:protect_ua_women/redux/actions.dart';
import 'package:redux/redux.dart';

final selectedTagsReducer = combineReducers<List<String>>([
  TypedReducer<List<String>, SetSelectedTagsAction>(_setSelectedTags),
]);

List<String> _setSelectedTags(List<String> state, action) {
  return action.selectedTags;
}
