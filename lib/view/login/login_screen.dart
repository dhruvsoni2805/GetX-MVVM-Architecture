import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// import '../../components/GenralException.dart';
import '../../utils/utils.dart';
import '../../view_models/controller/login/login_screen_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _autoValidate = AutovalidateMode.always;
  LoginScreenController loginscreencontroller =
      Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('exit'.tr),
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              content: Text("content".tr),
              actionsAlignment: MainAxisAlignment.spaceEvenly,
              actions: [
                OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('No'),
                ),
                OutlinedButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text('Yes'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Form(
              key: _formKey,
              autovalidateMode: _autoValidate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   "assets/images/contact_admin.jpg",
                  //   fit: BoxFit.fitHeight,
                  //   // height: 350,
                  // ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "loginform.title".tr.toUpperCase(),
                        style: GoogleFonts.inter(
                                textStyle:
                                    Theme.of(context).textTheme.displayMedium)
                            .copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
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
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: loginscreencontroller.emailcontroller.value,
                    focusNode: loginscreencontroller.emailFocusNode.value,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        // Utils.toastMessage('email.hinttext'.tr);
                        return "email.hinttext".tr;
                      }
                      // else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      //   return "eamil.invalid".tr;
                      // }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      Utils.feildFocusChange(
                          context,
                          loginscreencontroller.emailFocusNode.value,
                          loginscreencontroller.passwordFocusNode.value);
                    },
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
                  const SizedBox(
                    height: 5,
                  ),
                  Obx(
                    () => Column(
                      children: [
                        TextFormField(
                          // autovalidateMode: ,
                          controller:
                              loginscreencontroller.passswordcontroller.value,
                          obscureText: loginscreencontroller.showPassword.value,
                          obscuringCharacter: "*",
                          keyboardType: TextInputType.visiblePassword,
                          onFieldSubmitted: (value) {
                            if (value.isEmpty) {
                              Utils.snakbBar('password', 'enter');
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              // Utils.toastMessage('password.hinttext'.tr);
                              return "password.hinttext".tr;
                            } else if (value.length <= 6) {
                              return "password.invalid".tr;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "password.example".tr,
                            suffixIcon: IconButton(
                              onPressed: () {
                                loginscreencontroller.visiblePassword();
                              },
                              icon: loginscreencontroller.showPassword.value
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          loginscreencontroller.isLogin();
                        }
                        // Get.to(() => const GenralExceptionWidgets());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[400],
                        fixedSize: Size(Get.width * 0.7, Get.height * 0.06),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: Text(
                        "login.btntitle".tr,
                        style:
                            const TextStyle(fontSize: 25, color: Colors.white),
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
        ),
      ),
    );
  }
}
