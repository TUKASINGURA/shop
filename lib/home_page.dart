import 'package:flutter/material.dart';
import 'package:shop/cart_page.dart';
import 'package:shop/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> pages = const [
    ProductList(),
    CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: currentPage == 0 ? ProductList() : CartPage(), or the following line of code can be used to perform the same task
      //the indexedStack Enables to mantain the contents of the page when moving to another pages
      //in otherwards it allows the user to retain what was on the previous page
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          )
        ],
      ),
    );
  }
}
