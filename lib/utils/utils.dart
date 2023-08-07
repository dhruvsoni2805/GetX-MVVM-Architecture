import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_pattern/resources/colors/color.dart';
// import 'package:toast/toast.dart';

class Utils {
  static void feildFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: AppColors.redcolor,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0,
        gravity: ToastGravity.BOTTOM);
  }

  static snakbBar(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 20, right: 15, left: 15),
        backgroundColor: Colors.green);
  }

// static dialogBox() {}
}
