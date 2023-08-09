import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserListMenuScreen extends StatefulWidget {
  const UserListMenuScreen({super.key});

  @override
  State<UserListMenuScreen> createState() => _UserListMenuScreenState();
}

class _UserListMenuScreenState extends State<UserListMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text("Data"),
            onTap: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }
}
