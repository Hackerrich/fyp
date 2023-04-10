import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:framed_by/models/freelancers.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:framed_by/services/auth_service.dart';

import 'package:framed_by/utils/api.dart';

class FreelancerController extends GetxController {
  AuthService authService = AuthService();
  var isLoading = false.obs;
  var loading = false.obs;
  List<Freelancer> freelancerList = RxList.empty();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    get();
  }

  submit({data, required File image}) async {
    var token = await authService.getToken();
    data["token"] = token;
    isLoading.value = true;
    var request = http.MultipartRequest('POST', Uri.parse(ADD_FREELANCER));
    request.fields.addAll(data);
    request.files.add(await http.MultipartFile.fromPath('image', image.path));
    var response = await request.send();
    isLoading.value = false;
    var result = await response.stream.bytesToString();
    var decodedData = jsonDecode(result);
    var success = decodedData['success'];
    var message = decodedData['message'];

    if (success) {
      Get.back();
      Get.snackbar("Success", message,
          colorText: Colors.white, backgroundColor: Colors.green);
      await get();
    } else {
      Get.snackbar("Error", message,
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  Future<void> register(
      {required String username, required String password}) async {
    var data = {'username': username, 'password': password};
    loading.value = true;
    var response = await http.post(Uri.parse(FREELANCERADDAPI), body: data);
    loading.value = false;
    var decodedResponse = await jsonDecode(response.body);
    if (decodedResponse["success"]) {
      Get.back();
      Get.snackbar("Success", decodedResponse["message"],
          backgroundColor: Colors.white);
    } else {
      Get.snackbar("Failed", decodedResponse["message"],
          backgroundColor: Colors.white);
    }
  }

  toggle({data}) async {
    var token = await authService.getToken();
    data["token"] = token;
    var response = await http.post(Uri.parse(TOGGLE_FREELANCERS), body: data);
    isLoading.value = false;
    var decodedResponse = await jsonDecode(response.body);
    if (decodedResponse["success"]) {
      Get.snackbar("Success", decodedResponse["message"]);
    } else {
      Get.snackbar("Failed", decodedResponse["message"]);
    }
  }

  Future<void> get() async {
    isLoading.value = true;
    var response = await http.get(
      Uri.parse(FREELANCERGETAPI),
    );
    isLoading.value = false;
    var decodedResponse = await jsonDecode(response.body);
    if (decodedResponse["success"]) {
      freelancerList.clear();
      var Freelancers = await decodedResponse["data"];
      for (var Freelancer in Freelancers) {
        freelancerList.add(Freelancer.fromJson(Freelancer));
      }
      Get.snackbar("Success", decodedResponse["message"],
          backgroundColor: Colors.white);
    } else {
      Get.snackbar("Failed", decodedResponse["message"],
          backgroundColor: Colors.white);
    }
  }
}
