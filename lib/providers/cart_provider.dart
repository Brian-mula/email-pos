import 'package:emailpos/logic/cart_logic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = ChangeNotifierProvider<CartLogic>((ref) {
  return CartLogic();
});
