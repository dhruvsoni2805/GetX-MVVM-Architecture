import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_pattern/resources/colors/color.dart';

class InternetExceptionWidgets extends StatefulWidget {
  const InternetExceptionWidgets({super.key});

  @override
  State<InternetExceptionWidgets> createState() =>
      _InternetExceptionWidgetsState();
}

class _InternetExceptionWidgetsState extends State<InternetExceptionWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.red[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.cloud_off,
              size: 250,
              color: AppColors.redcolor,
            ),
            const Text(
              "No Internet",
              style: TextStyle(color: AppColors.redcolor, fontSize: 50),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    fixedSize: Size(Get.width * 0.7, Get.height * 0.07)),
                child: Text(
                  "Retry",
                  style: Theme.of(context).textTheme.titleLarge,
                ))
          ],
        ),
      ),
    );
  }
}
