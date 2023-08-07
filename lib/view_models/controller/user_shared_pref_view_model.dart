import 'package:shared_preferences/shared_preferences.dart';

import '../../models/login_model/user_model.dart';

class UserPref {
  Future<bool> addUser(UserModel responseModel) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', responseModel.token.toString());
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? tokenIs = pref.getString('token');
    return UserModel(token: tokenIs);
  }

  Future<bool> removeUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    return true;
  }
}
