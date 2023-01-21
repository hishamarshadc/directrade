import 'package:flutter/material.dart';
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
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text(
            'DirecTrade',
            style: TextStyle(
              fontSize: 27,
            ),
          ),
          actions: [
            InkWell(
              onTap: () => {
                Navigator.pushNamed(context,'custprofile')
              },
              child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.green,
                    backgroundImage: AssetImage('assets/images/seller.jpg'),
                  ),
            ),
      const SizedBox(
        width: 10,
      )
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
