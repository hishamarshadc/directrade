
import 'package:flutter/material.dart';
import 'package:sample_project/presentation/customer/screens/order/widgets/OrderCard.dart';
import 'package:sample_project/presentation/seller/screens/seller_orders/widgets/seller_order_card.dart';
import 'package:sample_project/presentation/user_model.dart';

class SellerOrderListPage extends StatelessWidget {
  SellerOrderListPage({super.key});

  // List<Order> orders = [
  //   Order(
  //       productName: "Apple",
  //       quantity: 2,
  //       totalPrice: 4.5,
  //       statusText: "Pending"),
  //   Order(
  //       productName: "Hand Bag Crafted",
  //       quantity: 5,
  //       totalPrice: 3.5,
  //       statusText: "Succussful"),
  //   Order(
  //       productName: "Pickled Mango",
  //       quantity: 2,
  //       totalPrice: 180,
  //       statusText: "Pending"),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: const SellerOrderCard(),
          ), itemCount: orders.length ),
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
