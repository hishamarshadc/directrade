import 'package:flutter/material.dart';
import 'package:sample_project/presentation/customer/screens/products/product_page.dart';
import 'package:sample_project/presentation/customer/screens/chat/chat_list.dart';
import 'package:sample_project/presentation/customer/screens/order/orders_list.dart';
import 'package:sample_project/presentation/customer/screens/search_catergory/search_category.dart';
// import 'package:sample_project/screens/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [
    ProductPage(),
    const SearchAndCategoryPage(),
    OrderListPage(),
    const ChatListPage(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text(
            'DirecTrade',
            style: TextStyle(
              fontSize: 27,
            ),
          ),
          actions: [
            IconButton(
              iconSize: 35,
              onPressed: () {
                Navigator.pushNamed(context, 'custprofile');
              },
              icon: const Icon(
                Icons.account_circle_outlined,
              ),
            ),
          ],
        ),
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 35),
              label: 'Home',
              
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 35),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, size: 35),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat, size: 35),
              label: 'Chat',
            )
          ],
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}
