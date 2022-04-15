import 'package:protect_ua_women/models/category.model.dart';
import 'package:protect_ua_women/redux/actions.dart';
import 'package:redux/redux.dart';

final categoriesReducer = combineReducers<List<Category>>([
  TypedReducer<List<Category>, SetCategoriesAction>(_setCategories),
]);

List<Category> _setCategories(List<Category> state, action) {
  return action.categories;
}
