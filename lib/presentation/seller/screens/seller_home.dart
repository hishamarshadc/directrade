import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sample_project/presentation/customer/screens/chat/chat_list.dart';
import 'package:sample_project/presentation/seller/screens/seller_chat/seller_chat.dart';
import 'package:sample_project/presentation/seller/screens/seller_orders/order_tabbar.dart';
import 'package:sample_project/presentation/seller/screens/seller_orders/seller_pending_orders.dart';
import 'package:sample_project/presentation/seller/screens/seller_products/seller_product.dart';

class SellerHomePage extends StatefulWidget {
  const SellerHomePage({super.key});

  @override
  State<SellerHomePage> createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {
  final pages = [
    const SellerProductPage(),
    SellerOrderTabBar(),
    ChatListPage()
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.boxes, size: 35),
              label: 'My Products', 
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_outlined, size: 35),
              label: 'My Orders',
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
