import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emailpos/logic/cart_logic.dart';
import 'package:emailpos/models/product_models.dart';
import 'package:flutter/cupertino.dart';

class Products {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  CartLogic cart = CartLogic();
  int quantity = 1;

  bool isLoading = false;
  // ! get all products

  Stream<List<ProductModel>> allProducts() async* {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('products').get();

    yield snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  }

  // ! search products

  Stream<List<ProductModel>> searchedProducts(String searchterm) async* {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection("products")
        .where("title", isEqualTo: searchterm)
        .get();

    yield snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  }

  // !add new product
  Future<void> addNewProduct(
      ProductModel productModel, BuildContext context) async {
    isLoading = true;
    await _products.add(productModel.toSnapshot());
    Navigator.pushNamed(context, '/home');
  }

  void addToCart(ProductModel productModel) {
    cart.addToCart(productModel, quantity);
  }
}
