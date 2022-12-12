import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? id;
  String title;
  String category;
  double price;
  double quantity;

  ProductModel(
      {this.id,
      required this.title,
      required this.quantity,
      required this.price,
      required this.category});

  Map<String, dynamic> toSnapshot() {
    return {
      'title': title,
      'category': category,
      'price': price,
      'quantity': quantity
    };
  }

  ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        title = doc.data()!['title'],
        price = doc.data()!['price'],
        quantity = doc.data()!['quantity'],
        category = doc.data()!['category'];

  String toJson() => json.encode(toSnapshot());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromJson(json.decode(source));
}
