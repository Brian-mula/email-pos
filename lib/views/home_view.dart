import 'package:emailpos/widgets/categorieswidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  TextEditingController searchController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/drinks.jpg'),
                          fit: BoxFit.cover)),
                  child: Stack(
                    children: [
                      Positioned(
                          left: 20,
                          top: 50,
                          child: Text(
                            "Hi",
                            style: theme.textTheme.headline5!
                                .copyWith(color: Colors.white),
                          )),
                      Positioned(
                          left: 20,
                          top: 80,
                          child: Text(
                            "Mulati Brian",
                            style: theme.textTheme.headline5!
                                .copyWith(color: Colors.white),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  height: 40,
                  width: double.maxFinite,
                  child: TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.orange)),
                        suffixIcon: const Icon(Icons.search),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(color: Colors.blue))),
                  ),
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
                        "Top categories",
                        style: theme.textTheme.bodyLarge,
                      ),
                      Text(
                        "See All",
                        style: theme.textTheme.bodyLarge,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Categories()
              ],
            )));
  }
}
