import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm_pattern/resources/routes/routes_name.dart';

import '../controller/user_preference/user_preference_controller.dart';

class SplashScreenServices {
  UserPreference userpreference = UserPreference();

  void isLogIn() {
    userpreference.getUser().then((value) {
      print(value.token);
      if (value.token!.isEmpty || value.token.toString() == 'null') {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RoutesName.loginScreen));
      } else {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RoutesName.homeScreen));
      }
    });
  }
}
