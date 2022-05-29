import 'package:safeway_api/safeway_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final SafeWayAPI _api = SafeWayAPI();

  Future<LoginResponse> login(String email, String password) async {
    LoginResponse response = await _api.login(email, password);

    if (response.success) {
      var pref = await SharedPreferences.getInstance();
      await pref.setString('token', response.data.access_token);
    }

    return response;
  }
}
