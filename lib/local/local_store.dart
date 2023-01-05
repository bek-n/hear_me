import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class LocalStore {
  Future<void> setUser(UserModel userModel) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    store.setString('user', jsonEncode(userModel.toJson()));
  }

  Future<UserModel> getUser() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    String? userJson = store.getString('user');
    UserModel user = UserModel.fromJson(jsonDecode(userJson ?? ""));
    return user;
  }



}
