
import 'package:flutter/material.dart';
import 'package:sample_project/presentation/customer/screens/order/widgets/OrderCard.dart';
import 'package:sample_project/presentation/customer/screens/order/widgets/cust_order_card.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustOrderCard(index:index),
            ), itemCount: 20 ),
      ),
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
