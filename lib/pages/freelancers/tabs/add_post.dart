import 'package:flutter/material.dart';

import 'package:framed_by/components/card_button.dart';
import 'package:get/get.dart';

import '../category_page.dart';

class Add_post extends StatelessWidget {
  const Add_post({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add post"),
        backgroundColor: Colors.black,
      ),
      body: Wrap(
        children: [
          Cardbutton(
            onTap: () {
              Get.bottomSheet(const CategoryPage());
            },
            lable: "Add new post",
            size: 48.0,
          ),
        ],
      ),
    );
  }
}
