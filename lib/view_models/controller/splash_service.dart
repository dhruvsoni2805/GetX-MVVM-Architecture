import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_pattern/resources/routes/routes_name.dart';
import 'package:getx_mvvm_pattern/view_models/controller/user_shared_pref_view_model.dart';

class SplashScreenServices {
  UserPref _userPref = UserPref();

  void isLogIn() {
    _userPref.getUser().then((value) {
      debugPrint("the splash screen service token is : ${value.token}");
      if (value.token == null) {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RoutesName.loginScreen));
      } else {
        debugPrint("Home Screen");
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RoutesName.homescreen));
      }
    });
  }
}
