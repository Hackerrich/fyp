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
        backgroundColor: Colors.amber,
        title: const Text("Freeelancerss Home"),
      ),
    );
  }
}
