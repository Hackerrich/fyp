
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void errorMessage(String message) {
  Get.snackbar("Error", message,
      backgroundColor: const Color.fromARGB(255, 238, 199, 199));
}

void successMessage(String message) {
  Get.snackbar("Success", message,
      backgroundColor: Color.fromARGB(255, 68, 175, 10));
}
