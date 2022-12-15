import 'package:emailpos/models/cart_model.dart';
import 'package:emailpos/models/product_models.dart';

class CartLogic {
  final Map<String, CartModel> _items = {};
  Map<String, CartModel> get items => _items;

  void addProductToCart(ProductModel productModel) {
    _items.putIfAbsent(productModel.id!, () {
      return CartModel(
          id: productModel.id,
          title: productModel.title,
          quantity: 1,
          price: productModel.price);
    });
  }
}
