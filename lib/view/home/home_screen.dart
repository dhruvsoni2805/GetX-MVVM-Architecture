import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_pattern/data/response/status.dart';
import 'package:getx_mvvm_pattern/resources/routes/routes_name.dart';
import 'package:getx_mvvm_pattern/view_models/controller/user_preference/user_preference_controller.dart';

import '../../view_models/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserPreference userpref = UserPreference();
  final homeController = Get.put(HomeScreenController());

  @override
  void initState() {
    // TODO: implement initState
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("HomeScreen"),
          actions: [
            IconButton(
                onPressed: () {
                  userpref
                      .removeUser()
                      .then((value) => Get.toNamed(RoutesName.loginScreen));
                },
                icon: Icon(Icons.logout))
          ],
        ),
        body: Obx(() {
          switch (homeController.rxRequestStatus.value) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text("Something Went Wrong"));
            case Status.COMPLETED:
              return Card(
                elevation: 10,
                child: ListView.builder(
                  itemCount: homeController.userlist.value.data!.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      // height:,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        // elevation: 10,
                        child: Card(
                          elevation: 10,
                          child: ExpansionTile(
                            leading: Image(
                              image: NetworkImage(homeController
                                  .userlist.value.data![index].avatar
                                  .toString()),
                              height: 150,
                              fit: BoxFit.fitHeight,
                            ),
                            /*CircleAvatar(
                              // radius: 50,
                              backgroundImage: NetworkImage(
                                homeController.userlist.value.data![index].avatar
                                    .toString(),
                              ),
                            ),*/
                            title: Text(homeController
                                .userlist.value.data![index].id
                                .toString()),
                            subtitle: Text(homeController
                                    .userlist.value.data![index].firstName
                                    .toString() +
                                homeController
                                    .userlist.value.data![index].firstName
                                    .toString()),
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Email"),
                                        Text(homeController
                                            .userlist.value.data![index].email
                                            .toString())
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
          }
        }));
  }
}
