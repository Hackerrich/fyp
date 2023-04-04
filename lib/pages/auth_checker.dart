import 'package:flutter/material.dart';
import 'package:framed_by/pages/freelancers/freelancers_home.dart';
import 'package:framed_by/pages/user/user_home_page.dart';
import 'package:get/get.dart';
import 'package:framed_by/pages/login.dart';
import 'package:framed_by/services/auth_service.dart';
import 'admin/admin_home.dart';

class AuthChecker extends StatefulWidget {
  const AuthChecker({super.key});

  @override
  State<AuthChecker> createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkIfLoggedIn();
  }

  checkIfLoggedIn() async {
    AuthService authService = AuthService();
    var token = await authService.getToken();

    if (token != null) {
      var role = await authService.getRole();

      switch (role) {
        case 'freelancer':
          Get.offAll(() => const FreelancersHome());
          break;
        case 'admin':
          Get.offAll(() => const AdminHome());
          break;
        default:
          Get.offAll(() => HomePage());
      }
    } else {
      Get.offAll(LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        color: Colors.black,
      )),
    );
  }
}
