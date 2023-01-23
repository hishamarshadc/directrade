
import 'package:flutter/material.dart';
import 'package:sample_project/presentation/customer/screens/order/widgets/OrderCard.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemBuilder: (context, index) => const OrderCard(), itemCount: 20 ),
    );
  }
}

class Order {
  final String? productName;
  final double? quantity;
  final double? totalPrice;
  final String? statusText;

  Order({this.productName, this.quantity, this.totalPrice, this.statusText});
}
