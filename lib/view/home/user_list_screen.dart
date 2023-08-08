import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_pattern/data/response/status.dart';
import 'package:getx_mvvm_pattern/resources/routes/routes_name.dart';
import 'package:getx_mvvm_pattern/view_models/controller/user_list_controller.dart';
import 'package:getx_mvvm_pattern/view_models/controller/user_shared_pref_view_model.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final userListController = Get.put(UserListController());
  UserPref userpref = UserPref();

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    userListController.userListApi();
  }

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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("userlist.apptitle".tr),
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Obx(() {
            switch (userListController.rxRequestStatus.value) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                return const Center(child: Icon(Icons.error));
              case Status.COMPLETED:
                return Column(
                  children: [
                    userListView(),
                  ],
                );
            }
            // return Container(
            //   color: Colors.lightBlue,
            // );
          }),
        ),
      ),
    );
  }

  Widget userListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: userListController.userlist.value.data!.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 10,
            margin: const EdgeInsets.only(bottom: 15),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: NetworkImage(userListController
                        .userlist.value.data![index].avatar
                        .toString()),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 10, left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("id".tr),
                            Text(
                                " : ${userListController.userlist.value.data![index].id.toString()}"),
                          ],
                        ),
                        const Divider(
                          indent: 10,
                          endIndent: 10,
                          // color: Colors.grey,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("name".tr),
                            Text(
                                " : ${userListController.userlist.value.data![index].firstName}  ${userListController.userlist.value.data![index].lastName}"),
                          ],
                        ),
                        const Divider(
                          indent: 10,
                          endIndent: 10,
                          // color: Colors.grey,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("email".tr),
                            SizedBox(
                              width: 180,
                              child: Tooltip(
                                message: userListController
                                    .userlist.value.data![index].email
                                    .toString(),
                                child: Text(
                                  " : ${userListController.userlist.value.data![index].email.toString()}",
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
