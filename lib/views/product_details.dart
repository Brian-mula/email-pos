import 'package:emailpos/models/product_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetails extends ConsumerStatefulWidget {
  const ProductDetails({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends ConsumerState<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text(product.title),
      ),
    );
  }
}
