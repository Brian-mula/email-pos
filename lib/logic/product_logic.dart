import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emailpos/models/product_models.dart';
import 'package:flutter/cupertino.dart';

class Products {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  bool isLoading = false;
  // ! get all products

  Future<List<ProductModel>> allProducts() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('products').get();

    return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  }

  // ! search products

  Future<List<ProductModel>> searchedProducts(String searchterm) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection("products")
        .where("title", isEqualTo: searchterm)
        .get();

    return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  }

  // !add new product
  Future<void> addNewProduct(
      ProductModel productModel, BuildContext context) async {
    isLoading = true;
    await _products.add(productModel.toSnapshot());
    Navigator.pushNamed(context, '/home');
  }
}
