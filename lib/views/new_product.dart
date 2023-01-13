import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emailpos/models/product_models.dart';
import 'package:emailpos/providers/products_provider.dart';
import 'package:emailpos/widgets/custome_input.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class NewProduct extends ConsumerStatefulWidget {
  const NewProduct({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewProductState();
}

class _NewProductState extends ConsumerState<NewProduct> {
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  String? imgUrl;
  FirebaseStorage storage = FirebaseStorage.instance;
  Future<void> uploadImage() async {
    final picker = ImagePicker();
    XFile? pickedImage;
    try {
      pickedImage = await picker.pickImage(source: ImageSource.gallery);
      final String fileName = path.basename(pickedImage!.name);
      File file = File(pickedImage.path);
      var snapshot =
          await storage.ref().child("images/$fileName").putFile(file);

      final downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        imgUrl = downloadUrl;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    List categories = ["Bakeries"];
    String selectedCategory = categories.first;

    _firestore
        .collection("categories")
        .get()
        .then(onError: (e) => print("error getting categories"), (res) {
      res.docs.map((doc) {
        categories.add(doc.data());
        print(categories);
      });
    });

    final product = ref.watch(productsProvider);
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Product"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: product.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Card(
                elevation: 0,
                child: Form(
                    child: Column(
                  children: [
                    CustomeInput(
                        controller: titleController,
                        labelText: "Title",
                        textInputType: TextInputType.text),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomeInput(
                        controller: priceController,
                        labelText: "Price",
                        textInputType: TextInputType.number),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomeInput(
                        controller: quantityController,
                        labelText: "Quantity",
                        textInputType: TextInputType.number),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Select Category:",
                      style: theme.textTheme.headline6!
                          .copyWith(color: Colors.black45),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButton(
                        value: selectedCategory,
                        isExpanded: true,
                        items:
                            categories.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            selectedCategory = value!;
                          });
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton.icon(
                        onPressed: () async {
                          await uploadImage();
                        },
                        icon: const Icon(Icons.camera),
                        label: const Text("Upload Image")),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () async {
                          ProductModel productModel = ProductModel(
                              title: titleController.text,
                              quantity: int.parse(quantityController.text),
                              price: int.parse(priceController.text),
                              category: "category",
                              image: imgUrl!);
                          await product.addNewProduct(productModel, context);
                        },
                        child: const Text("Save Product"))
                  ],
                )),
              ),
      ),
    );
  }
}
