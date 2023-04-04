import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:framed_by/components/app_button.dart';
import 'package:framed_by/controllers/category_controller.dart';
import 'package:framed_by/utils/messages.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  TextEditingController name = TextEditingController();
  CategoryController categoryController = Get.put(CategoryController());
  final _formKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();

  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2,
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Category",
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: name,
                  decoration: const InputDecoration(
                    hintText: "Enter your Category",
                    labelText: "Category",
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
                          label: "Add",
                          onPressed: () {
                            var isValid = _formKey.currentState!.validate();

                            if (image == null) {
                              errorMessage("File not provided");
                            }
                            if (isValid) {
                              var data = {'name': name.text};
                              categoryController.submit(
                                  data: data, image: File(image!.path));
                            }
                          },
                          width: Get.width,
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
