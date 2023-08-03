import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              Icons.cloud_off,
              size: 200,
              color: AppColors.redcolor,
            ),
            const Text(
              "No Data Found ",
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
