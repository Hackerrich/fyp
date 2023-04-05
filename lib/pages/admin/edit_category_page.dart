import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:framed_by/components/app_button.dart';
import 'package:framed_by/controllers/category_controller.dart';
import 'package:framed_by/utils/messages.dart';

import '../../utils/api.dart';

class EditCategoryPage extends StatefulWidget {
  const EditCategoryPage({super.key});

  @override
  State<EditCategoryPage> createState() => _EditCategoryPageState();
}

class _EditCategoryPageState extends State<EditCategoryPage> {
  TextEditingController name = TextEditingController();

  CategoryController categoryController = Get.put(CategoryController());
  final _formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();

  XFile? image;
  String? selectedCategories;
  List categoryItemListed = [];

  Future getAllCategory() async {
    var url = Uri.parse(CATEGORYGETAPI);
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
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  "Edit Category",
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(children: [
                  if (selectedCategories == null) ...[
                    Text(
                      selectedCategories ?? "Category Id : ",
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Please choose the Category Name first",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 14),
                    )
                  ] else ...[
                    Text(
                      "Category id : $selectedCategories",
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontSize: 20),
                    )
                  ]
                ]
                    // children: [
                    //   Text(

                    //     "Category id : $selectedCategories",
                    //     textAlign: TextAlign.right,
                    //     style: const TextStyle(fontSize: 20),
                    //   ),
                    // ],
                    ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      "Category Name :",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: DropdownButton(
                          isExpanded: true,
                          hint: const Text("Select Category Name"),
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
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                    hintText: "Enter your Category name",
                    labelText: "Category Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field cannot be empty";
                    }
                    return null;
                  },
                ),
                InkWell(
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
                Container(
                  child: categoryController.isLoading.value
                      ? const CircularProgressIndicator()
                      : AppButton(
                          label: "Edit Category",
                          onPressed: () {
                            var isValid = _formKey.currentState!.validate();

                            if (image == null) {
                              errorMessage("File not provided");
                            }
                            if (isValid) {
                              var data = {
                                'category_id': selectedCategories!,
                                'name': name.text
                              };
                              categoryController.edit(
                                  data: data, image: File(image!.path));
                            }
                          },
                          width: Get.width,
                        ),
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                // Container(
                //   child: categoryController.isLoading.value
                //       ? const CircularProgressIndicator()
                //       : AppButton(
                //           label: "Edit Image",
                //           onPressed: () {
                //             var isValid = _formKey.currentState!.validate();

                //             if (image == null) {
                //               errorMessage("File not provided");
                //             }
                //             if (isValid) {
                //               var data = {
                //                 'category_id': selectedCategories!,
                //                 'name' :
                //               };
                //               categoryController.editPhoto(
                //                   data: data, image: File(image!.path));
                //             }
                //           },
                //           width: Get.width,
                //         ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
