import 'package:emailpos/logic/product_logic.dart';
import 'package:emailpos/models/product_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsProvider = Provider<Products>((ref) {
  return Products();
});

final products = FutureProvider<List<ProductModel>>((ref) {
  return ref.read(productsProvider).allProducts();
});
