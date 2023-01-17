import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emailpos/models/product_models.dart';

class CartModel {
  String? id;
  String? title;
  int? quantity;
  int? price;
  String? image;
  ProductModel? productModel;

  CartModel(
      {this.id,
      this.price,
      this.quantity,
      this.title,
      this.productModel,
      this.image});

  CartModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        title = doc.data()!['title'],
        quantity = doc.data()!['quantity'],
        price = doc.data()!['price'],
        productModel = ProductModel.fromSnapshot(doc.data()!['productModel']);

  Map<String, dynamic> toSnapshot() {
    return {
      "id": id,
      "title": title,
      "quantity": quantity,
      "price": price,
      "product": productModel!.toSnapshot()
    };
  }
}
