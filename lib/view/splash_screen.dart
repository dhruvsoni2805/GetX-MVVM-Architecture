import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

import '../utils/utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 0),
        alignment: Alignment.center,
        color: Colors.green[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assets/images/contact_admin.jpg", fit: BoxFit.cover),
            const SizedBox(
              height: 50,
            ),
            Text(
              'email.hint'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.updateLocale(const Locale('hi', 'IN'));
                        },
                        child: const Text("Hindi")),
                    ElevatedButton(
                        onPressed: () {
                          Get.updateLocale(const Locale('en', 'US'));
                        },
                        child: const Text("English")),
                    ElevatedButton(
                        onPressed: () {
                          Get.updateLocale(const Locale('gu', 'IN'));
                        },
                        child: const Text("Gujarati")),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.updateLocale(const Locale('pu', 'IN'));
                        },
                        child: const Text("Punjabi")),
                    ElevatedButton(
                        onPressed: () {
                          Get.updateLocale(const Locale('sn', 'IN'));
                        },
                        child: const Text("sanskrut")),
                    ElevatedButton(
                        onPressed: () {
                          Get.updateLocale(const Locale('bn', 'IN'));
                        },
                        child: const Text("Bangla")),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.message_outlined),
          onPressed: () => {
                Utils.snakbBar("title", "message"),
                Utils.toastMessage("message"),
              }),
    );
  }
}
