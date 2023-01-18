import 'package:emailpos/models/cart_model.dart';
import 'package:emailpos/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartView extends ConsumerStatefulWidget {
  const CartView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartViewState();
}

class _CartViewState extends ConsumerState<CartView> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final cart = ref.watch(cartProvider);
    List<CartModel> items = cart.getCartItems();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/products");
            },
            child: Container(
              padding: const EdgeInsets.only(left: 15),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.orange.shade600,
                size: 30,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          title: Text(
            "My Cart",
            style: theme.textTheme.headline6!
                .copyWith(color: Colors.orange.shade600),
          ),
          centerTitle: true,
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                items.length.toString(),
                style: theme.textTheme.headline5!
                    .copyWith(color: Colors.red.shade600),
              ),
            )
          ],
        ),
        body: items.isNotEmpty
            ? Container(
                padding: const EdgeInsets.only(top: 25, right: 20, left: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    items[index].image!),
                                                fit: BoxFit.cover)),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            items[index].title!,
                                            style: theme.textTheme.bodyLarge!
                                                .copyWith(
                                                    color:
                                                        Colors.orange.shade600),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Ksh. ${items[index].price.toString()}",
                                            style: theme.textTheme.bodyLarge!
                                                .copyWith(
                                                    color:
                                                        Colors.orange.shade600),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.remove,
                                            size: 30,
                                          )),
                                      Text(
                                        "1",
                                        style: theme.textTheme.headline5,
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.add,
                                            size: 30,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Discount",
                              style: theme.textTheme.headline5!
                                  .copyWith(color: Colors.orange.shade600),
                            ),
                            Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade600,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const Center(
                                  child: Icon(
                                Icons.check,
                                size: 12,
                                color: Colors.white,
                              )),
                            )
                          ],
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.green.shade600)),
                            onPressed: () {},
                            child: Text(
                              "Apply",
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(color: Colors.white),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Order Summary",
                      style: theme.textTheme.headline6,
                    ),
                    CustomeRow(
                      theme: theme,
                      text: "Item total",
                      amount: cart.getTotalPrice(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomeRow(theme: theme, amount: 118, text: "Delivery fee"),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomeRow(
                        theme: theme,
                        amount: cart.getTotalPrice(),
                        text: "Total"),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                        width: 150,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/select_delivery');
                            },
                            child: const Text("CHECKOUT")))
                  ],
                ),
              )
            : Center(
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/products');
                    },
                    child: Text(
                      "Your cart is Empty!!!, go shop?",
                      style: theme.textTheme.headline6!
                          .copyWith(color: Colors.orange.shade600),
                    )),
              ));
  }
}

class CustomeRow extends StatelessWidget {
  const CustomeRow(
      {Key? key, required this.theme, required this.amount, required this.text})
      : super(key: key);

  final ThemeData theme;
  final String text;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: theme.textTheme.bodyLarge,
        ),
        Text(
          "ksh. $amount",
          style: theme.textTheme.bodyLarge,
        )
      ],
    );
  }
}
