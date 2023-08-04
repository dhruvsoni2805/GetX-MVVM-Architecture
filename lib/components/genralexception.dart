import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_pattern/components/internetExceptionWidget.dart';
import 'package:getx_mvvm_pattern/resources/colors/color.dart';

class GenralExceptionWidgets extends StatefulWidget {
  const GenralExceptionWidgets({super.key});

  @override
  State<GenralExceptionWidgets> createState() => _GenralExceptionWidgetsState();
}

class _GenralExceptionWidgetsState extends State<GenralExceptionWidgets> {
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
              Icons.error_outline,
              size: 150,
              color: AppColors.redcolor,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Text(
              "genralexception".tr,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            OutlinedButton(
                onPressed: () {
                  Get.to(() => const InternetExceptionWidgets());
                },
                style: OutlinedButton.styleFrom(
                    fixedSize: Size(Get.width * 0.5, Get.height * 0.05)),
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
