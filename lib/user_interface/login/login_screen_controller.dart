import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  final emailcontroller = TextEditingController().obs;
  final passswordcontroller = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool showPassword = false.obs;

  visiblePassword() {
    showPassword.value = !showPassword.value;
  }
}
