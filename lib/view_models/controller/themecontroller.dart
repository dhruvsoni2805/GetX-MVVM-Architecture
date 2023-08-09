import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController {
  RxBool themeValue = false.obs;

  changeTheme() {
    themeValue.value = !themeValue.value;
    themeValue.value
        ? Get.changeTheme(ThemeData.dark(useMaterial3: true))
        : Get.changeTheme(ThemeData.light(useMaterial3: true));
  }
}
