import 'package:flutter/material.dart';
import 'package:sample_project/auth/admin_login.dart';
import 'package:sample_project/presentation/customer/authentification/cust_login.dart';
import 'package:sample_project/presentation/customer/authentification/register.dart';
import 'package:sample_project/core/colors/Colors.dart';
import 'package:sample_project/presentation/customer/screens/home/home_page.dart';
import 'package:sample_project/presentation/customer/screens/home/user%20profile/customer_profile.dart';
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
      home: CustLoginPage(),
      routes: {
        'reg':(context) => const RegisterPage(),
        'login':(context) => CustLoginPage(),
        'admin':(context) => AdminLoginPage(),
        'home':(context) => const HomePage(),
        'custprofile':(context) => const CustProfilePage(),
      },
      debugShowCheckedModeBanner: false,// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
