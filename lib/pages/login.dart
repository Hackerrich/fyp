import 'package:framed_by/controllers/authentication_contorler.dart';
import 'package:framed_by/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:framed_by/components/app_button.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginController = Get.put(AuthenticationController());
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Center(
              child: Text(
            "Login",
            style: TextStyle(fontSize: 24),
          )),
          const SizedBox(height: 20),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: "Enter your username",
              labelText: "Username",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "Enter your Password",
              labelText: "Password",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Obx(() => Container(
                child: loginController.loading.value
                    ? const CircularProgressIndicator()
                    : AppButton(
                        width: Get.width,
                        onPressed: () {
                          loginController.login(
                              email: emailController.text,
                              password: passwordController.text);
                        },
                      ),
              )),
          const SizedBox(
            height: 20,
          ),
          const Text("DON'T HAVE ACCOUNT?"),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                Get.to(RegisterPage());
              },
              child: const Text("Sign Up")),
        ]),
      ),
    );
  }
}
