import 'package:flutter/material.dart';

class SellerHomePage extends StatefulWidget {
  const SellerHomePage({super.key});

  @override
  State<SellerHomePage> createState() => _SellerHomePageState();
}

class _SellerHomePageState extends State<SellerHomePage> {
  // final pages = [
  // ];

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
                Navigator.pushNamed(context, 'sellerprofile');
              },
              icon: const Icon(
                Icons.account_circle_outlined,
              ),
            ),
          ],
        ),
        // body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 35),
              label: 'My Products', 
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, size: 35),
              label: 'My Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat, size: 35),
              label: 'Chat',
            )
          ],
          // currentIndex: selectedIndex,
          // onTap: (value) {
          //   setState(() {
          //     selectedIndex = value;
          //   });
          // },
        ),
      ),
    );
  }
}
