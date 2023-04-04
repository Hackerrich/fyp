// import 'package:flutter/material.dart';

// class bookNow extends StatelessWidget {
//   const bookNow({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Text("Book Now"),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:framed_by/controllers/freelancers_controller.dart';
import 'package:framed_by/models/RegisterFreeelancers.dart';
import 'package:get/get.dart';
import 'package:framed_by/components/card_button.dart';

class Report extends StatelessWidget {
  final FreelancersController freelancerController =
      Get.put(FreelancersController());
  Report({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Merchants"),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          children: freelancerController.freelancersList
              .map((Freelancers freelancers) => Cardbutton(
                    onTap: () {},
                    lable: freelancers.username,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
