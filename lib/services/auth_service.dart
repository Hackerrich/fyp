import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  savetoken(String token, {role = false}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('role', role);
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    return token;
  }

  getRole() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var isAdmin = prefs.getString('role') ?? false;
    return isAdmin;
  }

  removeToken() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove('token');
      prefs.remove('isAdmin');
    });
  }
}
