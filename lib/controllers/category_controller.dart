import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:framed_by/services/auth_service.dart';

import 'package:framed_by/utils/api.dart';

import '../models/category.dart';

class CategoryController extends GetxController {
  AuthService authService = AuthService();

  var isLoading = false.obs;

  List<Categories> categoryList = RxList.empty();

  submit({data, required File image}) async {
    var token = await authService.getToken();
    data["token"] = token;
    isLoading.value = true;
    var request = http.MultipartRequest('POST', Uri.parse(ADD_CATEGORY));
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
    } else {
      Get.snackbar("Error", message,
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  Future get() async {
    isLoading.value = true;
    var response = await http.get(
      Uri.parse(CATEGORYGETAPI),
    );
    isLoading.value = false;
    var decodedResponse = await jsonDecode(response.body);
    if (decodedResponse["success"]) {
      categoryList.clear();
      var categories = await decodedResponse["data"];
      for (var category in categories) {
        categoryList.add(Categories.fromJson(category));
      }
      Get.snackbar("Success", decodedResponse["message"],
          backgroundColor: Colors.white);
    } else {
      Get.snackbar("Failed", decodedResponse["message"],
          backgroundColor: Colors.white);
    }
  }

  void edit({required Map<String, String> data, required File image}) {}

  // int? cityId;

  // void updateCityId(int id) {
  //   cityId = id;
  // }
}
