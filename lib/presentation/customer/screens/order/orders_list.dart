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
      backgroundColor: Colors.grey,
      body: ListView.builder(
          itemBuilder: (context, index) => OrderCard(), itemCount: 2000),
    );
    // return ListView.builder(
    //   itemCount: orders.length,
    //   itemBuilder: (context, index) {
    //     return Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Card(
    //         margin: const EdgeInsets.all(10),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             const SizedBox(height: 30),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Text(
    //                   "Product Name: ${orders[index].productName}",
    //                   style: const TextStyle(fontSize: 20),
    //                 ),
    //                 Text("X${orders[index].quantity?.toInt()}",
    //                     style: const TextStyle(fontSize: 20)),
    //               ],
    //             ),
    //             const SizedBox(height: 20),
    //             Text("Total Price: ${orders[index].totalPrice}",
    //                 style: const TextStyle(fontSize: 20)),
    //             const SizedBox(height: 20),
    //             Container(
    //               decoration: BoxDecoration(
    //                 color: Colors.green,
    //                 borderRadius: BorderRadius.circular(10),
    //               ),
    //               padding: const EdgeInsets.all(5),
    //               child: Text("${orders[index].statusText}",
    //                   style: const TextStyle(color: Colors.white, fontSize: 20)),
    //             ),
    //             const SizedBox(height: 30),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}

class Order {
  final String? productName;
  final double? quantity;
  final double? totalPrice;
  final String? statusText;

  Order({this.productName, this.quantity, this.totalPrice, this.statusText});
}
