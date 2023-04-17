import 'package:flutter/material.dart';
import 'package:sample_project/core/colors/Colors.dart';
import 'package:sample_project/presentation/seller/screens/seller_orders/seller_cancelled_order.dart';
import 'package:sample_project/presentation/seller/screens/seller_orders/seller_complete_orders.dart';
import 'package:sample_project/presentation/seller/screens/seller_orders/seller_pending_orders.dart';

class SellerOrderTabBar extends StatefulWidget {
  const SellerOrderTabBar({super.key});

  @override
  State<SellerOrderTabBar> createState() => Seller_OrderTabBarState();
}

class Seller_OrderTabBarState extends State<SellerOrderTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child:Scaffold(
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
        bottom: TabBar(tabs: const [
          Tab(
            child: Text(
              'Pending',
              style: TextStyle(color: textColor),
            ),
          ),
          Tab(
            child: Text(
              'Completed',
              style: TextStyle(color: textColor),
            ),
          ),
          Tab(
            child: Text(
              'Cancelled',
              style: TextStyle(color: textColor),
            ),
          ),
        ]),
      ),
      body: TabBarView(
        children: [
          SellerOrderPending(),
          SellerOrderComplete(),
          SellerOrderCancelled()
        ],
      ),
    )
     );

     
  }
}
