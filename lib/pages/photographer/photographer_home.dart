import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/services.dart';
import '../auth_checker.dart';

class PhotographerHome extends StatelessWidget {
  AuthService authService = AuthService();
  PhotographerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text("Photographer"),
        actions: [
          IconButton(
              onPressed: () async {
                await authService.removeToken();
                Get.to(const AuthChecker());
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
    );
  }
}
