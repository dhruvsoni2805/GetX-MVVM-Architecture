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
        backgroundColor: AppColors.lightblackcolor,
        gravity: ToastGravity.BOTTOM);
  }

  static snakbBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColors.lightblackcolor,
    );
  }
}
