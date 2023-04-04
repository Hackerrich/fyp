import 'dart:convert';
import 'dart:io';
import 'package:framed_by/controllers/category_controller.dart';
import 'package:framed_by/utils/api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:framed_by/components/app_button.dart';
import 'package:framed_by/controllers/freelancer_controller.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/messages.dart';

// class AddMerchant extends StatelessWidget {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   final FreelancerController freelancersController =
//       Get.put(FreelancerController());
//   AddMerchant({super.key});
//   final ImagePicker _picker = ImagePicker();
//   XFile? image;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: Get.height / 2,
//       color: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             const Center(
//                 child: Text(
//               "Add Freelancers",
//               style: TextStyle(fontSize: 20),
//             )),
//             TextFormField(
//               controller: usernameController,
//               decoration: const InputDecoration(
//                 hintText: "Enter merchant username",
//                 labelText: "Username",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             TextFormField(
//               controller: passwordController,
//               decoration: const InputDecoration(
//                 hintText: "Enter merchant password",
//                 labelText: "Password",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: InkWell(
//                   onTap: () async {
//                     image =
//                         await _picker.pickImage(source: ImageSource.gallery);
//                     setState(() {});
//                   },
//                   child: SizedBox(
//                     height: 200,
//                     width: 200,
//                     child: image != null
//                         ? Image.file(
//                             File(image!.path),
//                             fit: BoxFit.cover,
//                           )
//                         : Image.network(
//                             "https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg"),
//                   ),
//                 ),
//               ),
//             Obx(() => Container(
//                   child: freelancersController.loading.value
//                       ? const CircularProgressIndicator()
//                       : AppButton(
//                           onPressed: () {
//                             freelancersController.register(
//                                 username: usernameController.text,
//                                 password: passwordController.text);
//                           },
//                           width: Get.width,
//                           label: "Add",
//                         ),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }

class AddMerchant extends StatefulWidget {
  AddMerchant({super.key});
  final categoryController = Get.put(CategoryController());

  @override
  State<AddMerchant> createState() => _AddMerchantState();
}

class _AddMerchantState extends State<AddMerchant> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final FreelancerController freelancerController =
      Get.put(FreelancerController());
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  String? selectedCategories;
  List categoryItemListed = [];

  Future getAllCategory() async {
    var url = Uri.parse(GETCATEGORIES);
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        categoryItemListed = jsonData;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Center(
                  child: Text(
                "Add Freelancer",
                style: TextStyle(fontSize: 20),
              )),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  hintText: "Enter freelancer username",
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: "Enter freelancer password",
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: "Enter description",
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 100,
                width: 400,
                child: DropdownButton(
                    isExpanded: true,
                    hint: const Text("Select Category"),
                    value: selectedCategories,
                    items: categoryItemListed.map((category) {
                      return DropdownMenuItem(
                          value: category['category_id'].toString(),
                          child: Text(category['name']));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCategories = value;
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () async {
                    image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {});
                  },
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: image != null
                        ? Image.file(
                            File(image!.path),
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            "https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small_2x/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg"),
                  ),
                ),
              ),
              Obx(() => Container(
                    child: freelancerController.loading.value
                        ? const CircularProgressIndicator()
                        : AppButton(
                            onPressed: () {
                              if (image == null) {
                                errorMessage("File not provided");
                              }
                              var data = {
                                'username': usernameController.text,
                                'password': passwordController.text,
                                'description': descriptionController.text,
                                'category_id': selectedCategories!.toString(),
                              };
                              freelancerController.submit(
                                  data: data, image: File(image!.path));
                            },
                            width: Get.width,
                            label: "Add",
                          ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
