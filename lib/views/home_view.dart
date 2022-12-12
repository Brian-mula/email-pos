import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue.shade600,
        centerTitle: true,
        title: const Text("Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            Row(
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
            Container(
              margin: const EdgeInsets.only(top: 25),
              height: 710,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/product-details");
                        },
                        child: ListTile(
                          leading: Container(
                            height: 150,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        "https://cdn.pixabay.com/photo/2017/08/06/16/30/computer-2593921__340.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                          title: Text(
                            "HP Monitor",
                            style: theme.textTheme.bodyLarge,
                          ),
                          subtitle: Text(
                            "Ksh.30000",
                            style: theme.textTheme.bodyLarge!
                                .copyWith(color: Colors.orange.shade600),
                          ),
                          trailing: Text(
                            "30",
                            style: theme.textTheme.bodyLarge!
                                .copyWith(color: Colors.orange.shade600),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
