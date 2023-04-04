import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:framed_by/components/app_button.dart';
import 'package:framed_by/pages/auth_checker.dart';
import 'package:framed_by/services/auth_service.dart';

class Profile extends StatelessWidget {
  final bool isFreelancers;
  const Profile({super.key, this.isFreelancers = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isFreelancers ? Colors.amber : Colors.black,
        title: const Text("Profile"),
      ),
      body: Column(
        children: [
          const Center(
              child: Icon(
            Icons.person,
            size: 200,
          )),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Name:"),
              ],
            ),
          ),
          AppButton(
            label: "Logout",
            onPressed: () {
              AuthService authService = AuthService();
              authService.removeToken();
              Get.to(const AuthChecker());
            },
          )
        ],
      ),
    );
  }
}
