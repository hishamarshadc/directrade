import 'package:flutter/material.dart';
import 'package:sample_project/presentation/admin/screens/admin_home.dart';
import 'package:sample_project/presentation/authentication/login.dart';
import 'package:sample_project/presentation/authentication/cust_register.dart';
import 'package:sample_project/core/colors/Colors.dart';
import 'package:sample_project/presentation/authentication/seller_register.dart';
import 'package:sample_project/presentation/customer/screens/cust_botton_nav.dart';
import 'package:sample_project/presentation/customer/screens/user%20profile/customer_profile.dart';
import 'package:sample_project/presentation/seller/screens/seller_home.dart';
import 'package:sample_project/presentation/seller/screens/seller_profile/seller_prof.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DirecTrade Demo',
      theme: ThemeData(
        primarySwatch: primaryWhite,
      ),
      home: LoginPage(),
      routes: {
        'custreg':(context) => const CustRegisterPage(),
        'sellreg' :(context) => const SellerRegisterPage(),
        'login':(context) => LoginPage(),
        'home':(context) => const HomePage(),
        'custprofile':(context) =>  CustProfilePage(),
        'adminhome':(context) => const AdminHomePage(),
        'sellerhome':(context) => SellerHomePage(),
        'sellerprofile':(context) => SellerProfilePage()
      },
      debugShowCheckedModeBanner: false,// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
