import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';

class UserPref {
  Future<bool> addUser(UserModel responseModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', responseModel.token.toString());
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? tokenIS = pref.getString("token");
    debugPrint("token is : $tokenIS");
    return UserModel(token: pref.getString('token'));
  }

  Future<bool> removeUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    debugPrint(pref.getString("token"));
    pref.clear();
    return true;
  }
}
