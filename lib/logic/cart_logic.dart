import 'package:emailpos/models/cart_model.dart';
import 'package:emailpos/models/product_models.dart';
import 'package:flutter/cupertino.dart';

class CartLogic extends ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};
  Map<String, dynamic> get cartItems => _cartItems;
  void addToCart(ProductModel productModel, int quantity) {
    print("adding to cart${productModel.title}");

    _cartItems.putIfAbsent(productModel.id!, () {
      return CartModel(
          id: productModel.id,
          price: productModel.price,
          quantity: quantity,
          title: productModel.title,
          image: productModel.image);
    });
    notifyListeners();
  }

  // ! get a list of cart items
  List<CartModel> getCartItems() {
    return _cartItems.entries.map((e) {
      return e.value;
    }).toList();
  }
}
