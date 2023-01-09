import 'package:emailpos/widgets/singleCategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Categories extends ConsumerStatefulWidget {
  const Categories({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoriesState();
}

class _CategoriesState extends ConsumerState<Categories>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Container(
            child: TabBar(
                indicatorColor: Colors.orange.shade600,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black38,
                controller: controller,
                tabs: const [
                  Tab(
                    text: "Bakeries",
                  ),
                  Tab(
                    text: "Drinks",
                  ),
                  Tab(
                    text: "Fruits",
                  ),
                  Tab(
                    text: "Electronics",
                  ),
                ]),
          ),
          SizedBox(
            height: 300,
            width: double.maxFinite,
            child: TabBarView(controller: controller, children: const [
              SinngeCategory(),
              Text("Drinks"),
              Text("Fruits"),
              Text("Electronics"),
            ]),
          )
        ],
      ),
    );
  }
}
