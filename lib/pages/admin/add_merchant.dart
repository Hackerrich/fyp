
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:framed_by/components/app_button.dart';
import 'package:framed_by/controllers/merchant_controller.dart';

class AddMerchant extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final MerchantController merchantController = Get.put(MerchantController());
  AddMerchant({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Center(
                child: Text(
              "Add Merchant",
              style: TextStyle(fontSize: 20),
            )),
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(
                hintText: "Enter merchant username",
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: "Enter merchant password",
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            Obx(() => Container(
                  child: merchantController.loading.value
                      ? const CircularProgressIndicator()
                      : AppButton(
                          onPressed: () {
                            merchantController.register(
                                username: usernameController.text,
                                password: passwordController.text);
                          },
                          width: Get.width,
                          label: "Add",
                        ),
                ))
          ],
        ),
      ),
    );
  }
}
