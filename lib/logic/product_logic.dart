import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emailpos/models/product_models.dart';

class Products {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  // ! get all products

  Future<List<ProductModel>> allProducts() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection('products').get();

    return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
  }
}
