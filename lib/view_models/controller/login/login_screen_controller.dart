import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_pattern/models/login_model/user_model.dart';
import 'package:getx_mvvm_pattern/utils/utils.dart';

import '../../../repository/login_repository.dart';
import '../../../resources/routes/routes_name.dart';
import '../user_shared_pref_view_model.dart';

class LoginScreenController extends GetxController {
  UserPref userpref = UserPref();
  final emailcontroller = TextEditingController().obs;
  final passswordcontroller = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  RxBool showPassword = true.obs;

  final _api = LoginRepository();

  visiblePassword() {
    showPassword.value = !showPassword.value;
  }

  void isLogin() {
    Map data = {
      'email': emailcontroller.value.text,
      'password': passswordcontroller.value.text
    };
    _api.LoginApi(data).then((value) {
      if (value['error'] == 400) {
        Utils.snakbBar("400 Error ", value.toString());
      } else {
        userpref
            .addUser(UserModel.fromJson(value))
            .then(
              (value) => Get.toNamed(RoutesName.homescreen),
            )
            .onError((error, stackTrace) => null);
        Utils.snakbBar("Congrtulation", value.toString());
      }
    }).onError((error, stackTrace) {
      print(error.toString());
      Utils.snakbBar('Error', error.toString());
    });
  }
}
