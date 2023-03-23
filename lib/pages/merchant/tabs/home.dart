import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:framed_by/components/card_button.dart';
import 'package:framed_by/pages/merchant/category_page.dart';
import 'package:framed_by/pages/merchant/production_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Merchant Home"),
      ),
      body: Wrap(
        children: [
          Cardbutton(
            onTap: () {
              Get.bottomSheet(const CategoryPage());
            },
            lable: "Add Category",
          ),
          // Cardbutton(
          //   onTap: () {
          //     Get.bottomSheet(const ProductPage());
          //   },
          //   lable: "Add Product",
          // ),
          Cardbutton(
            onTap: () {
              Get.bottomSheet(ProductionPage());
            },
            lable: "Add Freelancer",
          )
        ],
      ),
    );
  }
}
