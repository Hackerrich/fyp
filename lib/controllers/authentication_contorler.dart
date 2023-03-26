import 'dart:convert' show jsonDecode;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:framed_by/pages/auth_checker.dart';

import 'package:framed_by/utils/api.dart';

import '../services/auth_service.dart';

class AuthenticationController extends GetxController {
  final AuthService authService = AuthService();

  var loading = false.obs;
  Future<void> login({required String email, required String password}) async {
    var data = {'username': email, 'password': password};
    loading.value = true;
    var response = await http.post(Uri.parse(LOGINAPI), body: data);
    loading.value = false;
    var decodedResponse = await jsonDecode(response.body);

    if (decodedResponse["success"]) {
      Get.snackbar("Success", decodedResponse["message"]);
      var token = decodedResponse["token"];
      var role = decodedResponse["role"];
      print(decodedResponse);
      await authService.savetoken(token, role: role);

      Get.to(() => const AuthChecker());
    } else {
      Get.snackbar("Failed", decodedResponse["message"]);
    }
  }

  Future<void> register(
      {required String email, required String password}) async {
    var data = {'username': email, 'password': password};
    loading.value = true;
    var response = await http.post(Uri.parse(SIGNUPAPI), body: data);
    loading.value = false;
    var decodedResponse = await jsonDecode(response.body);
    if (decodedResponse["success"]) {
      Get.snackbar("Success", decodedResponse["message"]);
      print(decodedResponse);
      Get.to(() => const AuthChecker());
    } else {
      Get.snackbar("Failed", decodedResponse["message"]);
    }
  }
}
