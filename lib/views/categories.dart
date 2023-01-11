import 'package:emailpos/models/category_model.dart';
import 'package:emailpos/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesPage extends ConsumerStatefulWidget {
  const CategoriesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<CategoriesPage> {
  TextEditingController titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final cat = ref.watch(categoryProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "All Categories",
          style: theme.textTheme.headline6!.copyWith(color: Colors.white),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "New Category",
                                    style: theme.textTheme.headline6!.copyWith(
                                        color: Colors.orange.shade600),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter category name";
                                      }
                                      return null;
                                    },
                                    controller: titleController,
                                    decoration: InputDecoration(
                                        labelText: "Category name",
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            borderSide: BorderSide(
                                                color: Colors.orange.shade700)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            borderSide: BorderSide(
                                                color: Colors.blue.shade600))),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("Close")),
                                      TextButton.icon(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.green.shade600)),
                                          onPressed: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              CategoryModel categoryModel =
                                                  CategoryModel(
                                                      catname:
                                                          titleController.text);
                                              await cat
                                                  .newCategory(categoryModel);
                                              Navigator.pop(context);
                                            }
                                          },
                                          icon: const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          ),
                                          label: Text(
                                            "Save",
                                            style: theme.textTheme.bodyLarge!
                                                .copyWith(color: Colors.white),
                                          ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                icon: const Icon(
                  Icons.add,
                  size: 30,
                )),
          )
        ],
      ),
    );
  }
}
