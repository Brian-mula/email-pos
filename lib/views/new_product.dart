import 'dart:async';
import 'dart:io';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Product"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Card(
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
              ElevatedButton.icon(
                  onPressed: () async {
                    await uploadImage();
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text("Upload Image"))
            ],
          )),
        ),
      ),
    );
  }
}
