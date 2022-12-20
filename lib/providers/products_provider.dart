import 'package:emailpos/logic/product_logic.dart';
import 'package:emailpos/models/product_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsProvider = Provider<Products>((ref) {
  return Products();
});

final products = StreamProvider<List<ProductModel>>((ref) {
  return ref.read(productsProvider).allProducts();
});
final searchTerm = StateProvider((ref) => "");
final searchedProduct = FutureProvider<List<ProductModel>>((ref) async {
  final search = ref.watch(searchTerm);
  final prod = await ref.watch(products.future);
  return prod.where((element) => element.title == search).toList();
});
