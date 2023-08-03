import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/contact_admin.jpg",
                  fit: BoxFit.fitHeight,
                  // height: 350,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "loginform.title".tr.toUpperCase(),
                      style: GoogleFonts.kalam(
                          textStyle: Theme.of(context).textTheme.displayMedium),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 3),
                    child: Text(
                      "email.hinttext".tr,
                    ),
                  ),
                ),
                TextFormField(
                  // controller: logincontroller.emailController.value,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "email.example".tr,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 3),
                    child: Text(
                      "password.hinttext".tr,
                    ),
                  ),
                ),
                TextFormField(
                  // controller: logincontroller.passwordController.value,
                  // obscureText: logincontroller.visiablePassword.value,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "password.example".tr,
                    suffixIcon: IconButton(
                        onPressed: () {
                          // logincontroller.passwordState();
                        },
                        icon: const Icon(Icons.visibility_off)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[400],
                      fixedSize: Size(Get.width * 0.7, Get.height * 0.06),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    child: Text(
                      "login.btntitle".tr,
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Text("email : eve.holt@reqres.in"),
                const Text("password : cityslicka"),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
