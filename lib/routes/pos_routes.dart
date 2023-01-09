import 'package:emailpos/views/auth_checker.dart';
import 'package:emailpos/views/error_route.dart';
import 'package:emailpos/views/home_view.dart';
import 'package:emailpos/views/login_view.dart';
import 'package:emailpos/views/new_product.dart';
import 'package:emailpos/views/product_details.dart';
import 'package:emailpos/views/products.dart';
import 'package:emailpos/views/register_view.dart';
import 'package:flutter/material.dart';

class PosRoutes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const AuthCker());
      case '/login':
        return MaterialPageRoute(builder: (context) => const LoginView());
      case '/register':
        return MaterialPageRoute(builder: (context) => const RegisterView());
      case '/product-details':
        return MaterialPageRoute(builder: (context) => const ProductDetails());
      case '/new_product':
        return MaterialPageRoute(builder: (context) => const NewProduct());
      case '/home':
        return MaterialPageRoute(builder: (context) => const HomeView());
      case '/products':
        return MaterialPageRoute(builder: (context) => const ProductsView());
      default:
        return MaterialPageRoute(builder: (context) => const ErrorRoute());
    }
  }
}
