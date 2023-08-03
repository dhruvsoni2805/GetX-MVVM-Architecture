import 'dart:async';

import 'package:get/get.dart';

class SplashScreenServices {
  void isLogIn() {
    Timer(const Duration(seconds: 3), () => Get.toNamed('/login_screen'));
  }
}
