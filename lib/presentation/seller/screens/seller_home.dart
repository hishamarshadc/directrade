import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sample_project/presentation/seller/screens/seller_chat/seller_chat.dart';
import 'package:sample_project/presentation/seller/screens/seller_orders/seller_orders.dart';
import 'package:sample_project/presentation/seller/screens/seller_products/seller_product.dart';

class SellerHomePage extends StatefulWidget {
  const SellerHomePage({super.key});

  @override
  State<SellerHomePage> createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {
  final pages = [
    const SellerProductPage(),
    SellerOrderListPage(),
    const SellerChatPage()
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
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
                Navigator.pushNamed(context, 'sellerprofile');
              },
              icon: const Icon(
                Icons.account_circle_outlined,
              ),
            ),
          ],
        ),
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.lightBlue,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.boxes, size: 25),
              label: 'My Products', 
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_outlined, size: 25),
              label: 'My Orders',
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
