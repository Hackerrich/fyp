import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:framed_by/controllers/production_controller.dart';
import 'package:framed_by/models/production.dart';

import '../../../utils/api.dart';

class BookingM extends StatelessWidget {
  ProductionController productionController = Get.put(ProductionController());
  BookingM({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("Bookings"),
        ),
        body: SingleChildScrollView(
          child: Obx(() => Column(
                children: productionController.productionList
                    .map((Production production) => DoctorCard(production))
                    .toList(),
              )),
        ));
  }

  Widget DoctorCard(Production production) {
    return Container(
        height: 450,
        width: 250,
        color: Color.fromARGB(255, 221, 187, 187),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(baseUrl + production.image!),
              Text(production.name!),
              Text(production.description!),
              Text(production.price!),
              Text(production.category!),
              Text(production.approved == '0' ? "Not Approved" : "Approved")
            ],
          ),
        ));
  }
}

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:week_one_project/controllers/category_controller.dart';
// import 'package:week_one_project/models/category.dart';

// import '../../../utils/api.dart';

// class BookingM  extends StatelessWidget {
//   CategoryController categoryController = Get.put(CategoryController());
//   BookingM ({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.amber,
//           title: const Text("Bookings"),
//         ),
//         body: SingleChildScrollView(
//           child: Obx(() => Column(
//                 children: categoryController.categoryList
//                     .map((Categories category) => DoctorCard(category))
//                     .toList(),
//               )),
//         ));
//   }

//   Widget DoctorCard(Categories category) {
//     return Container(
//         height: 450,
//         width: 250,
//         color: Color.fromARGB(255, 221, 187, 187),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Text(category.id!),
//               Text(category.name!),
//             ],
//           ),
//         ));
//   }
// }
