import 'package:emailpos/widgets/custome_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewProduct extends ConsumerStatefulWidget {
  const NewProduct({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewProductState();
}

class _NewProductState extends ConsumerState<NewProduct> {
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
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
                  onPressed: () {},
                  icon: const Icon(Icons.camera),
                  label: const Text("Upload Image"))
            ],
          )),
        ),
      ),
    );
  }
}
