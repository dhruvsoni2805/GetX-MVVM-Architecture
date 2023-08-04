import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_pattern/view_models/services/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashScreenServices splashScreen = SplashScreenServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 0),
        alignment: Alignment.center,
        color: Colors.green[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'welcome.title'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/login_screen');
                  // Get.to(() => LoginScreen());
                },
                child: const Text("Login")),
          ],
        ),
      ),
    );
  }
}
