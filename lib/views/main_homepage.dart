import 'package:emailpos/views/accounts.dart';
import 'package:emailpos/views/home_view.dart';
import 'package:emailpos/views/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainHomePage extends ConsumerStatefulWidget {
  const MainHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainHomePageState();
}

class _MainHomePageState extends ConsumerState<MainHomePage> {
  List pages = [const HomeView(), const ProductsView(), const Accounts()];

  int selectedIndex = 0;
  void _onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0.0,
          selectedItemColor: Colors.blue.shade500,
          unselectedItemColor: Colors.black54,
          currentIndex: selectedIndex,
          onTap: _onTap,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.branding_watermark), label: "Products"),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "Account")
          ]),
    );
  }
}
