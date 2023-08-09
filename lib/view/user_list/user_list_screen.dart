import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_pattern/resources/routes/routes_name.dart';
import 'package:getx_mvvm_pattern/view/user_list/user_list_body.dart';
import 'package:getx_mvvm_pattern/view/user_list/user_list_drawer_screen.dart';
import 'package:getx_mvvm_pattern/view_models/controller/user_list_controller.dart';
import 'package:getx_mvvm_pattern/view_models/controller/user_shared_pref_view_model.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen>
    with SingleTickerProviderStateMixin {
  final userListController = Get.put(UserListController());
  UserPref userpref = UserPref();

  late AnimationController _animationcontroller;
  bool isActive = true;

  @override
  void initState() {
    super.initState();
    _animationcontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    userListController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
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
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text("userlist.apptitle".tr),
          // leading: IconButton(
          //   onPressed: () {},
          //   icon: AnimatedIcon(
          //     icon: AnimatedIcons.menu_home,
          //     progress: _animationcontroller,
          //   ),
          // ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "exit".tr,
                    content: Text("content".tr),
                    confirm: OutlinedButton(
                      onPressed: () {
                        userpref.removeUser().then(
                            (value) => Get.toNamed(RoutesName.loginScreen));
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
                icon: const Icon(Icons.logout))
          ],
        ),
        body: UserListappBar(),
        drawer: USerListDrawerScreen(),
      ),
    );
  }
}
