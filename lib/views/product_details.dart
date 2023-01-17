import 'package:emailpos/models/product_models.dart';
import 'package:emailpos/providers/products_provider.dart';
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
    ThemeData theme = Theme.of(context);
    final productLogic = ref.watch(productsProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(product.image), fit: BoxFit.cover)),
              )),
          Positioned(
              right: 15,
              top: 40,
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 30,
                  ))),
          Positioned(
              left: 0,
              right: 0,
              top: 295,
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    DetailsRow(
                      theme: theme,
                      text: "Product name",
                      value: product.title,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DetailsRow(
                        theme: theme,
                        text: "Price",
                        value: "Ksh. ${product.price.toString()}"),
                    const SizedBox(
                      height: 20,
                    ),
                    DetailsRow(
                        theme: theme,
                        text: "Available stock",
                        value: product.quantity.toString())
                  ],
                ),
              )),
          Positioned(
              left: 70,
              right: 70,
              bottom: 0,
              child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.orange.shade600)),
                  onPressed: () {
                    ProductModel productModel = ProductModel(
                        id: product.id,
                        title: product.title,
                        price: product.price,
                        category: product.category,
                        image: product.image);
                    productLogic.addToCart(productModel);
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  label: const Text("Add to cart")))
        ],
      ),
    );
  }
}

class DetailsRow extends StatelessWidget {
  const DetailsRow(
      {Key? key, required this.theme, required this.text, required this.value})
      : super(key: key);

  final ThemeData theme;
  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$text:",
          style: theme.textTheme.headline6!
              .copyWith(color: Colors.orange.shade600),
        ),
        Text(
          value,
          style: theme.textTheme.headline6,
        )
      ],
    );
  }
}
