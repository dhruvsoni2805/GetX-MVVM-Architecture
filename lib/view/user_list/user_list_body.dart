import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_pattern/view_models/controller/themecontroller.dart';

import '../../data/response/status.dart';
import '../../view_models/controller/user_list_controller.dart';
import '../../view_models/controller/user_shared_pref_view_model.dart';

class UserListappBar extends StatefulWidget {
  const UserListappBar({super.key});

  @override
  State<UserListappBar> createState() => _UserListappBodyState();
}

class _UserListappBodyState extends State<UserListappBar>
    with SingleTickerProviderStateMixin {
  final userListController = Get.put(UserListController());
  final themecontroller = Get.put(ThemeController());
  UserPref userpref = UserPref();

  @override
  void initState() {
    super.initState();
    userListController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
      }),
    );
  }

  Widget userListView() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        // itemCount: userListController.userlist.value.data!.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.only(bottom: 15),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xff240b36),
                      Color(0xffc31432),
                    ]),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: NetworkImage(userListController
                          .userlist.value.data![index].avatar
                          .toString()),
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: 250,
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 10, right: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "id".tr,
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "name".tr,
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "email".tr,
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ":".tr,
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              ":".tr,
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              ":".tr,
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                userListController
                                    .userlist.value.data![index].id
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                " ${userListController.userlist.value.data![index].firstName}  ${userListController.userlist.value.data![index].lastName}",
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Obx(
                                () => Tooltip(
                                  enableFeedback: true,
                                  message: userListController
                                      .userlist.value.data![index].email
                                      .toString(),
                                  decoration: BoxDecoration(
                                    color: themecontroller.themeValue.value
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  child: Text(
                                    userListController
                                        .userlist.value.data![index].email
                                        .toString(),
                                    maxLines: 1,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      /* children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "id".tr,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              " : ${userListController.userlist.value.data![index].id.toString()}",
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
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
                            Text(
                              "name".tr,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              " : ${userListController.userlist.value.data![index].firstName}  ${userListController.userlist.value.data![index].lastName}",
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
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
                            Text(
                              "email".tr,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
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
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],*/
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
