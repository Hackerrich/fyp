import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:framed_by/models/merchant.dart';
import 'package:framed_by/utils/api.dart';

class MerchantController extends GetxController {
  var loading = false.obs;
  List<Merchant> merchantsList = RxList.empty();
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
    var response = await http.post(Uri.parse(MERCAHNTADDAPI), body: data);
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
      Uri.parse(MERCAHNTGETAPI),
    );
    loading.value = false;
    var decodedResponse = await jsonDecode(response.body);
    if (decodedResponse["success"]) {
      var merchants = await decodedResponse["data"];
      for (var merchant in merchants) {
        merchantsList.add(Merchant.fromJson(merchant));
      }
      print(merchantsList);

      Get.snackbar("Success", decodedResponse["message"],
          backgroundColor: Colors.white);
    } else {
      Get.snackbar("Failed", decodedResponse["message"],
          backgroundColor: Colors.white);
    }
  }
}
