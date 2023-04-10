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
import 'package:framed_by/models/freelancers.dart';

import 'package:framed_by/utils/api.dart';
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
          title: const Text("Freelancers"),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await freelancerController.get();
          },
          child: SingleChildScrollView(
            child: GetBuilder<FreelancersController>(
                id: 'freelancers',
                builder: ((controller) {
                  if (controller.freelancersList == null) {
                    return CircularProgressIndicator();
                  }
                  return Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 10),
                          shrinkWrap: true,
                          itemCount: controller.freelancersList!.data.length,
                          itemBuilder: (context, index) {
                            Freelancer freelancer =
                                controller.freelancersList!.data[index];
                            return Container(
                                margin: EdgeInsets.only(bottom: 20),
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 12,
                                          blurRadius: 10)
                                    ]),
                                height: 200,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Freelancer Useraname: ",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          freelancer.username.toUpperCase(),
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          height: 150,
                                          width: 150,
                                          child: Image(
                                            image: NetworkImage(
                                                baseUrl + freelancer.image),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 150,
                                              child: Text(
                                                  'DESCRIPTION: ${freelancer.description}'),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ));
                          }),
                    ],
                  );
                })),
          ),
        ));
  }
}
