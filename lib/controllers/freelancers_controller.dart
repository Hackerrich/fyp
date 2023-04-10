import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:framed_by/models/freelancers.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:framed_by/utils/api.dart';

class FreelancersController extends GetxController {
  var loading = false.obs;
  Freelancers? freelancersList;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    get();
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

  Future<void> get() async {
    loading.value = true;
    var response = await http.get(
      Uri.parse(FREELANCERGETAPI),
    );
    loading.value = false;
    var decodedResponse = await jsonDecode(response.body);
    if (decodedResponse["success"]) {
      print(response.body);
      freelancersList = freelancersFromJson(response.body);
      update(['freelancers']);
      // var freelancers = await decodedResponse["data"];
      // for (var freelancer in freelancers) {
      //   freelancersList = freelancerFromJson(freelancers);
      // }
      print(freelancersList);

      Get.snackbar("Success", decodedResponse["message"],
          backgroundColor: Colors.white);
    } else {
      Get.snackbar("Failed", decodedResponse["message"],
          backgroundColor: Colors.white);
    }
  }
}
