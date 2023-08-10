import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_pattern/view_models/controller/user_material_controller.dart';

class UserMaterialScreen extends StatefulWidget {
  const UserMaterialScreen({super.key});

  @override
  State<UserMaterialScreen> createState() => _UserMaterialScreenState();
}

class _UserMaterialScreenState extends State<UserMaterialScreen> {
  final usermaterialcontroller = Get.put(UserMaterialScreenController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usermaterialcontroller.usermatrialApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("usermaterial".tr),
      ),
      body: Obx(() {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              ListView.builder(
                itemCount:
                    usermaterialcontroller.usermateriallist.value.data?.length,
                itemBuilder: (context, index) {
                  return UserListMaterialWidget(index);
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  // ignore: non_constant_identifier_names
  Widget UserListMaterialWidget(int index) {
    return Column(
      children: [
        Card(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color(0xffc471ed),
                  Color(0xff12c2e9),
                ]),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "id".tr,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      usermaterialcontroller
                          .usermateriallist.value.data![index].id
                          .toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "name".tr,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      usermaterialcontroller
                          .usermateriallist.value.data![index].name
                          .toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "year".tr,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      usermaterialcontroller
                          .usermateriallist.value.data![index].year
                          .toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "color".tr,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      usermaterialcontroller
                          .usermateriallist.value.data![index].color
                          .toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "pantone_value".tr,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      usermaterialcontroller
                          .usermateriallist.value.data![index].pantoneValue
                          .toString(),
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
