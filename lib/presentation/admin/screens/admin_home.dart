import 'package:flutter/material.dart';
import 'package:sample_project/presentation/admin/screens/approvals/approval%20pages/seller_approval.dart';
import 'package:sample_project/presentation/admin/screens/approvals/approval_tab_bar.dart';
import 'package:sample_project/presentation/admin/screens/view_users/view_customers/view_customers.dart';
import 'package:sample_project/presentation/admin/screens/view_users/view_sellers/view_sellers.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final pages = [
    const ApprovalTabBar(),
    const ViewSellersPage(),
    const ViewCustPage()
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Colors.white,
        //   foregroundColor: Colors.black,
        //   title: const Text(
        //     'Admin Dashboard',
        //     style: TextStyle(
        //       fontSize: 27,
        //     ),
        //   ),
        //   actions: [
        //     IconButton(
        //       iconSize: 35,
        //       onPressed: () {
        //         // Navigator.pushNamed(context, 'custprofile');
        //       },
        //       icon: const Icon(
        //         Icons.account_circle_outlined,
        //       ),
        //     ),
        //   ],
        // ),
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.verified_outlined, size: 35),
              label: 'Approvals',
              
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.currency_rupee_rounded, size: 35),
              label: 'Sellers',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_rounded, size: 35),
              label: 'Customers',
            ),
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
