import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample_project/core/colors/Colors.dart';
import 'package:sample_project/presentation/admin/screens/approvals/approval%20pages/seller_approval.dart';
import 'package:sample_project/presentation/admin/screens/approvals/approval%20pages/seller_edit_approval.dart';

class ApprovalTabBar extends StatefulWidget {
  const ApprovalTabBar({super.key});

  @override
  State<ApprovalTabBar> createState() => _ApprovalTabBarState();
}

class _ApprovalTabBarState extends State<ApprovalTabBar> {
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
              Tab(child: Text('Seller Approvals',style: TextStyle(color: textColor),),),
              Tab(child: Text('Changes Approvals',style: TextStyle(color: textColor),),),
            ]
            ),
          ),
          body:TabBarView(
            children: [
              SellerApprovalPage(),
              SellerEditsPage()
            ]
            ),
      ),
    );
  }
}