import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/presentation/aboutus.dart';
import 'package:sample_project/presentation/admin/screens/admin_home.dart';
import 'package:sample_project/presentation/admin/screens/adminprofile/adminprofile.dart';
import 'package:sample_project/presentation/authentication/login.dart';
import 'package:sample_project/presentation/authentication/cust_register.dart';
import 'package:sample_project/core/colors/Colors.dart';
import 'package:sample_project/presentation/authentication/seller_register.dart';
import 'package:sample_project/presentation/customer/screens/cust_botton_nav.dart';
import 'package:sample_project/presentation/customer/screens/feedback/feedback_form.dart';
import 'package:sample_project/presentation/customer/screens/user%20profile/customer_profile.dart';
import 'package:sample_project/presentation/customer/screens/user%20profile/edit_profile/edit_customer_profile.dart';
import 'package:sample_project/presentation/feedback.dart';
import 'package:sample_project/presentation/seller/screens/seller_home.dart';
import 'package:sample_project/presentation/seller/screens/seller_orders/seller_pending_orders.dart';
import 'package:sample_project/presentation/seller/screens/seller_products/widgets/addproduct.dart';
import 'package:sample_project/presentation/seller/screens/seller_products/widgets/seller_product_view.dart';
import 'package:sample_project/presentation/seller/screens/seller_profile/edit_seller_profile/edit_seller_profile.dart';
import 'package:sample_project/presentation/seller/screens/seller_profile/seller_prof.dart';
import 'package:sample_project/presentation/testdetails.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        'custreg':(context) => CustRegisterPage(),
        'sellreg' :(context) => const SellerRegisterPage(),
        'login':(context) => LoginPage(),
        'home':(context) => const HomePage(),
        'custprofile':(context) =>  const CustProfilePage(),
        'adminhome':(context) => const AdminHomePage(),
        'sellerhome':(context) => const SellerHomePage(),
        'sellerprofile':(context) => const SellerProfilePage(),
        'editcust':(context) => CustEdit(),
        'editseller':(context) => const EditSeller(),
        'sellerorderpage':(context) =>  SellerOrderListPage(),
        'aboutus':(context) =>   AboutPage(),
        'adminprofile':(context) => const AdminProfilePage(),
        'test':(context)=> DataFetch(),
        'addProdForm':(context) => AddProductForm(),
        'feedback': (context) => FeedbackBox(),
      },
      debugShowCheckedModeBanner: false,// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
