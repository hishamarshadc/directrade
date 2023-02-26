import 'package:flutter/material.dart';
import 'package:sample_project/presentation/chat/chat_list.dart';
import 'package:sample_project/presentation/customer/screens/homepage/customer_home.dart';
import 'package:sample_project/presentation/customer/screens/order/cust_tabbar.dart';
import 'package:sample_project/presentation/customer/screens/search_catergory/search_category.dart';
// import 'package:sample_project/screens/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [
    CustHomePage(),
    const SearchAndCategoryPage(),
    const CustOrderTabBar(),
    ChatListPage(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.lightBlue,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 25),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 25),
              label: 'Products &\n  Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, size: 25),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat, size: 25),
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
