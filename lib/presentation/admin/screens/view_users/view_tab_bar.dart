import 'package:flutter/material.dart';
import 'package:sample_project/core/colors/Colors.dart';
import 'package:sample_project/presentation/admin/screens/view_users/view_customers.dart';
import 'package:sample_project/presentation/admin/screens/view_users/view_sellers.dart';

class ViewTabBar extends StatelessWidget {
  const ViewTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: const Text(
              'Admin Dashboard',
              style: TextStyle(
                fontSize: 27,
              ),
            ),
            actions: [
              IconButton(
                iconSize: 35,
                onPressed: () {
                  Navigator.pushNamed(context, 'adminprofile');
                },
                icon: const Icon(
                  Icons.account_circle_outlined,
                ),
              ),
            ],
            // ignore: prefer_const_constructors
            bottom:TabBar(tabs: 
             const [
              Tab(child: Text('View Sellers',style: TextStyle(color: textColor),),),
              Tab(child: Text('View Customers',style: TextStyle(color: textColor),),),
            ]
            ),
          ),
          body:const TabBarView(
            children: [
              ViewSellersPage(),
              ViewCustPage()
            ]
            ),
      ),
    );
  }
}