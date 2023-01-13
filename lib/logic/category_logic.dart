import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emailpos/models/category_model.dart';

class CategoryLogic {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference categories =
      FirebaseFirestore.instance.collection("categories");

  Future<void> newCategory(CategoryModel categoryModel) async {
    await categories.add(categoryModel.toSnapshot());
  }
}
