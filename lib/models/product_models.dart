import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? id;
  String title;
  String category;
  String image;
  int price;
  int? quantity;

  ProductModel(
      {this.id,
      required this.title,
      this.quantity,
      required this.price,
      required this.category,
      required this.image});

  ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        title = doc.data()!['title'],
        price = doc.data()!['price'],
        quantity = doc.data()!['quantity'] ?? 0,
        category = doc.data()!['category'],
        image = doc.data()!['image'] ?? "";

  Map<String, dynamic> toSnapshot() {
    return {
      'title': title,
      'category': category,
      'price': price,
      'quantity': quantity,
      'image': image
    };
  }

  String toJson() => json.encode(toSnapshot());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromJson(json.decode(source));
}
