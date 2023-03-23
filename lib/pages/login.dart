// import 'package:framed_by/controllers/authentication_contorler.dart';
// import 'package:framed_by/pages/signup.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:framed_by/components/app_button.dart';

// class LoginPage extends StatelessWidget {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   final loginController = Get.put(AuthenticationController());
//   LoginPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.only(right: 20, left: 20),
//         child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           const Center(
//               child: Text(
//             "Login",
//             style: TextStyle(fontSize: 24),
//           )),
//           const SizedBox(height: 20),
//           TextFormField(
//             controller: emailController,
//             decoration: const InputDecoration(
//               hintText: "Enter your username",
//               labelText: "Username",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 20),
//           TextFormField(
//             controller: passwordController,
//             obscureText: true,
//             decoration: const InputDecoration(
//               hintText: "Enter your Password",
//               labelText: "Password",
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Obx(() => Container(
//                 child: loginController.loading.value
//                     ? const CircularProgressIndicator()
//                     : AppButton(
//                         width: Get.width,
//                         onPressed: () {
//                           loginController.login(
//                               email: emailController.text,
//                               password: passwordController.text);
//                         },
//                       ),
//               )),
//           const SizedBox(
//             height: 20,
//           ),
//           const Text("DON'T HAVE ACCOUNT?"),
//           const SizedBox(
//             height: 10,
//           ),
//           InkWell(
//               onTap: () {
//                 Get.to(RegisterPage());
//               },
//               child: const Text("Sign Up")),
//         ]),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/authentication_contorler.dart';
import '../pages/signup.dart';
import '../components/app_button.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginController = Get.put(AuthenticationController());
  LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Lets Sign you in',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Robotto',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 32),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email & Username',
                filled: true,
                fillColor: Colors.grey.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.grey.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Obx(
              () => loginController.loading.value
                  ? const CircularProgressIndicator()
                  : AppButton(
                      onPressed: () => loginController.login(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      ),
                    ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
                TextButton(
                  onPressed: () {
                    Get.to(() => RegisterPage());
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
