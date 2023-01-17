import 'package:emailpos/models/product_models.dart';

class CartLogic {
  final Map<String, dynamic> _cartItems = {};
  Map<String, dynamic> get cartItems => _cartItems;
  void addToCart(ProductModel productModel, int quantity) {
    print("adding to cart${productModel.title}");
    _cartItems.putIfAbsent(productModel.id!, () {
      return ProductModel(
          title: productModel.title,
          quantity: quantity,
          price: productModel.price,
          category: productModel.category,
          image: productModel.image);
    });
  }
}
