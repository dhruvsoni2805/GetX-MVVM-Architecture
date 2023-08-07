import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("userlist.apptitle".tr),
        actions: [
          IconButton(
              onPressed: () {
                Get.defaultDialog(
                  title: "Exit App",
                  content: Text("Do You Want to Really Exit App ?"),
                  confirm: OutlinedButton(
                    onPressed: () {
                      userpref
                          .removeUser()
                          .then((value) => Get.toNamed(RoutesName.loginScreen));
                    },
                    child: Text("Yes"),
                  ),
                  cancel: OutlinedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("No"),
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
                  Expanded(
                    child: ListView.builder(
                      itemCount: userListController.userlist.value.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 10,
                          margin: const EdgeInsets.only(bottom: 10),
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
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("email".tr),
                                          SizedBox(
                                            width: 180,
                                            child: Tooltip(
                                              message: userListController
                                                  .userlist
                                                  .value
                                                  .data![index]
                                                  .email
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
                  ),
                ],
              );
          }
          // return Container(
          //   color: Colors.lightBlue,
          // );
        }),
      ),
    );
  }
}
