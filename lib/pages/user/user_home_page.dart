import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/auth_service.dart';
import '../auth_checker.dart';

class HomePage extends StatelessWidget {
  AuthService authService = AuthService();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text("My chats"),
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
