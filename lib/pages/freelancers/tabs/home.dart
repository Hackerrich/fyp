import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:framed_by/components/card_button.dart';
import 'package:framed_by/pages/freelancers/category_page.dart';
import 'package:framed_by/pages/freelancers/production_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Welcome Home"),
      ),
      body: Wrap(
        children: [
          Cardbutton(
            onTap: () {
              Get.bottomSheet(const CategoryPage());
            },
            lable: "Add Category",
            size: 48.0,
          ),
          Cardbutton(
            onTap: () {
              Get.bottomSheet(ProductionPage());
            },
            lable: "Add Freelancer",
            size: 48.0,
          )
        ],
      ),
    );
  }
}
