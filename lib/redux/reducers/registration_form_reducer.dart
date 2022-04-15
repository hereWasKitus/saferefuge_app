import 'package:protect_ua_women/models/registration_form.model.dart';
import 'package:protect_ua_women/redux/actions.dart';
import 'package:redux/redux.dart';

final registrationFormReducer = combineReducers<RegistrationForm>([
  TypedReducer<RegistrationForm, SetRegistrationFormAction>(
      _setRegistrationForm),
]);

RegistrationForm _setRegistrationForm(RegistrationForm state, action) {
  return action.registrationForm;
}
