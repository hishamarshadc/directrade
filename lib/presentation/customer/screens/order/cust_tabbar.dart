import 'package:flutter/material.dart';
import 'package:sample_project/core/colors/Colors.dart';
import 'package:sample_project/presentation/customer/screens/order/cust_order_cancel.dart';
import 'package:sample_project/presentation/customer/screens/order/cust_order_complete.dart';
import 'package:sample_project/presentation/customer/screens/order/cust_order_pending.dart';

class CustOrderTabBar extends StatefulWidget {
  const CustOrderTabBar({super.key});

  @override
  State<CustOrderTabBar> createState() => _CustOrderTabBarState();
}

class _CustOrderTabBarState extends State<CustOrderTabBar> {
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
                Navigator.pushNamed(context, 'custprofile');
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
          CustOrderPendingPage(),
          CustOrderCompletePage(),
          CustOrderCancelPage()
        ],
      ),
    )
     );

     
  }
}