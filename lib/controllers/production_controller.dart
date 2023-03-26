import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:framed_by/utils/api.dart';

import '../models/production.dart';
import '../services/auth_service.dart';

class ProductionController extends GetxController {
  AuthService authService = AuthService();
  var isLoading = false.obs;
  List<Production> productionList = RxList.empty();
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

  toggle({data}) async {
    var token = await authService.getToken();
    data["token"] = token;
    var response = await http.post(Uri.parse(TOGGLE_PHOTOGRAPHER), body: data);
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
      productionList.clear();
      var doctors = await decodedResponse["data"];
      for (var doctor in doctors) {
        productionList.add(Production.fromJson(doctor));
      }
      Get.snackbar("Success", decodedResponse["message"],
          backgroundColor: Colors.white);
    } else {
      Get.snackbar("Failed", decodedResponse["message"],
          backgroundColor: Colors.white);
    }
  }
}
