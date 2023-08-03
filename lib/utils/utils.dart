import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_pattern/resources/colors/color.dart';

// import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';

class Utils {
  static void feildFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Toast.show(message,
        // textColor: AppColors.Light_black_Color,
        // backgroundColor: Colors.red,
        backgroundColor: AppColors.Light_black_Color,
        gravity: Toast.bottom);
  }

  static snakbBar(String title, String message) {
    Get.snackbar(title, message, backgroundColor: AppColors.Light_black_Color);
  }
}
