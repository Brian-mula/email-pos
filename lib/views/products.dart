import 'package:emailpos/providers/products_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsView extends ConsumerStatefulWidget {
  const ProductsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductsViewState();
}

class _ProductsViewState extends ConsumerState<ProductsView> {
  TextEditingController searchController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var product = ref.watch(products);
    // final searchProduct = ref.watch(dbSearchedProds);
    // var searchResults = ref.watch(searchedProduct);
    var search = ref.watch(searchTerm);
    void searchProducts(String term) {
      setState(() {
        search = term;
        // product = searchResults;
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue.shade600,
        centerTitle: true,
        title: const Text("Products"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/new_product");
              },
              icon: const Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.orange.shade600),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/man.png"),
                ),
                accountName:
                    Text(auth.currentUser!.displayName ?? "Not Available"),
                accountEmail: Text(auth.currentUser!.email!)),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.orange.shade600,
              ),
              title: Text(
                "Home",
                style: theme.textTheme.bodyLarge!
                    .copyWith(color: Colors.orange.shade600),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.add,
                color: Colors.orange.shade600,
              ),
              title: Text(
                "New Product",
                style: theme.textTheme.bodyLarge!
                    .copyWith(color: Colors.orange.shade600),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/categories");
              },
              child: ListTile(
                leading: Icon(
                  Icons.store,
                  color: Colors.orange.shade600,
                ),
                title: Text(
                  "Categories",
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: Colors.orange.shade600),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/cart");
              },
              child: ListTile(
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.orange.shade600,
                ),
                title: Text(
                  "Cart",
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: Colors.orange.shade600),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) => searchProducts(value),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Search in Products",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide:
                            BorderSide(color: Colors.blue.shade500, width: 1)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.orange.shade700))),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Product name",
                      style: theme.textTheme.bodyLarge,
                    ),
                    Text(
                      "In Stock",
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: Colors.orange.shade600),
                    )
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 25),
                  height: 630,
                  child: product.when(
                      data: (data) {
                        return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin:
                                    const EdgeInsets.only(bottom: 10, top: 0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, "/product-details",
                                        arguments: data[index]);
                                  },
                                  child: ListTile(
                                    leading: Container(
                                      height: 150,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  data[index].image),
                                              fit: BoxFit.cover)),
                                    ),
                                    title: Text(
                                      data[index].title,
                                      style: theme.textTheme.bodyLarge,
                                    ),
                                    subtitle: Text(
                                      "Ksh.${data[index].price.toString()}",
                                      style: theme.textTheme.bodyLarge!
                                          .copyWith(
                                              color: Colors.orange.shade600),
                                    ),
                                    trailing: Text(
                                      data[index].quantity.toString(),
                                      style: theme.textTheme.bodyLarge!
                                          .copyWith(
                                              color: Colors.orange.shade600),
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      error: (error, stacktrace) => Text(error.toString()),
                      loading: () => const Center(
                            child: CircularProgressIndicator(),
                          )))
            ],
          ),
        ),
      ),
    );
  }
}
