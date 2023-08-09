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
      child: ListView(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("ownername".tr),
                  Text("ownermail".tr),
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
    );
  }
}
