import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/routes/routes_name.dart';
import '../../view_models/controller/themecontroller.dart';
import '../../view_models/controller/user_shared_pref_view_model.dart';

class USerListDrawerScreen extends StatefulWidget {
  const USerListDrawerScreen({super.key});

  @override
  State<USerListDrawerScreen> createState() => _USerListDrawerScreenState();
}

class _USerListDrawerScreenState extends State<USerListDrawerScreen> {
  final themeController = Get.put(ThemeController());
  UserPref userpref = UserPref();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Obx(
      () => Container(
        color: themeController.themeValue.value ? Colors.black26 : Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xfff5af19),
                        Color(0xfff12711),
                      ]),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: themeController.themeValue.value
                          ? Colors.black
                          : Colors.white,
                      // backgroundColor: Colors.blue,
                      child: Image.asset(
                        "assets/images/user.png",
                        scale: 10,
                        color: themeController.themeValue.value
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    Text(
                      "ownername".tr,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "ownermail".tr,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: Text("usermaterial".tr),
              onTap: () {
                Get.toNamed(RoutesName.usermaterial);
              },
            ),
            Obx(
              () => ListTile(
                leading: Image(
                  image: const AssetImage('assets/icons/theme.png'),
                  height: 27,
                  color: themeController.themeValue.value
                      ? Colors.white
                      : Colors.grey[800],
                ),
                title: Text(themeController.themeValue.value
                    ? 'themedart'.tr
                    : 'themelight'.tr),
                trailing: Obx(
                  () => Switch(
                      value: themeController.themeValue.value,
                      onChanged: (value) {
                        themeController.changeTheme();
                      }),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Get.defaultDialog(
                  title: "exit".tr,
                  content: Text("content".tr),
                  confirm: OutlinedButton(
                    onPressed: () {
                      userpref
                          .removeUser()
                          .then((value) => Get.toNamed(RoutesName.loginScreen));
                    },
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text("yes".tr),
                  ),
                  cancel: OutlinedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text("no".tr),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
