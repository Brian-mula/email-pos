import 'package:emailpos/firebase_options.dart';
import 'package:emailpos/views/auth_checker.dart';
import 'package:emailpos/views/cart_view.dart';
import 'package:emailpos/views/categories.dart';
import 'package:emailpos/views/home_view.dart';
import 'package:emailpos/views/login_view.dart';
import 'package:emailpos/views/new_product.dart';
import 'package:emailpos/views/product_details.dart';
import 'package:emailpos/views/products.dart';
import 'package:emailpos/views/register_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const LoginView(),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthCker(),
        '/login': (context) => const LoginView(),
        '/register': (context) => const RegisterView(),
        '/home': (context) => const HomeView(),
        '/product-details': (context) => const ProductDetails(),
        "/new_product": (context) => const NewProduct(),
        '/categories': (context) => const CategoriesPage(),
        '/products': (context) => const ProductsView(),
        '/cart': (context) => const CartView()
      },
      // onGenerateRoute: (settings) => PosRoutes.generateRoute(settings),
    );
  }
}
