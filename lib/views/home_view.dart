import 'package:emailpos/providers/products_provider.dart';
import 'package:emailpos/widgets/custome_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final product = ref.watch(products);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue.shade600,
        centerTitle: true,
        title: const Text("Products"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              CustomeInput(
                  controller: searchController,
                  labelText: "Search in products",
                  textInputType: TextInputType.text),
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
                                          image: const DecorationImage(
                                              image: NetworkImage(
                                                  "https://cdn.pixabay.com/photo/2017/08/06/16/30/computer-2593921__340.jpg"),
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
