
import 'package:flutter/material.dart';
import 'package:sample_project/presentation/customer/screens/order/widgets/OrderCard.dart';

class OrderListPage extends StatelessWidget {
  OrderListPage({super.key});

  List<Order> orders = [
    Order(
        productName: "Apple",
        quantity: 2,
        totalPrice: 4.5,
        statusText: "Pending"),
    Order(
        productName: "Hand Bag Crafted",
        quantity: 5,
        totalPrice: 3.5,
        statusText: "Succussful"),
    Order(
        productName: "Pickled Mango",
        quantity: 2,
        totalPrice: 180,
        statusText: "Pending"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemBuilder: (context, index) => const OrderCard(), itemCount: 2000 ),
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
