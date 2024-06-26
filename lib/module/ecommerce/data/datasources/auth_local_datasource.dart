import 'package:flutter_pos_ecommerce/module/ecommerce/data/models/responses/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  static String role = "ROLE";

  static Future<String> getRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? role = prefs.getString(AuthLocalDatasource.role);
    return role ?? '';
  }

  static saveRole(String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AuthLocalDatasource.role, role);
  }

  Future<void> saveAuthData(AuthResponseModel authResponseModel) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_data', authResponseModel.toJson());
  }

  Future<void> removeAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_data');
  }

  Future<AuthResponseModel?> getAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    final authData = prefs.getString('auth_data');
    if (authData != null) {
      return AuthResponseModel.fromJson(authData);
    } else {
      return null;
    }
  }

  Future<bool> isAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final authData = prefs.getString('auth_data');
    if (authData != null) {
      return true;
    } else {
      return false;
    }
  }
}
