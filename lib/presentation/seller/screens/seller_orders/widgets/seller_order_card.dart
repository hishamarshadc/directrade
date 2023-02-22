import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sample_project/presentation/chat/chat_message_page.dart';

class SellerOrderCard extends StatelessWidget {
  const SellerOrderCard(
      {required this.orderdoc, required this.productdoc, super.key});
  final DocumentSnapshot orderdoc;
  final DocumentSnapshot productdoc;

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;

    String formatTimestamp(Timestamp timestamp) {
      var format =
          new DateFormat('hh:mm a dd MMM yyyy'); // <- use skeleton here
      return format.format(timestamp.toDate());
    }

    String orderdatetime = formatTimestamp(orderdoc['datetime']);

    final visibility = (orderdoc['status'] == 'p') ? true : false;

    final size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(orderdoc['customer_id'])
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            );
          }

          if (!snapshot.hasData) {
            return Text('Document does not exist');
          }
          // Extract data from the snapshot and display it
          final custdoc = snapshot.data!;

          return Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(width: size.width * .03),
                          Container(
                            width: size.width * .25,
                            height: size.width * .25,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              color: Colors.blue.shade200,
                              image: DecorationImage(
                                image: NetworkImage(productdoc['image_url']!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: size.width * .5,
                                  child: Text(
                                    productdoc['product_name']!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: size.width * .2,
                                  height: size.width * .06,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      (productdoc['sell_type'] == 'w')
                                          ? 'Wholesale'
                                          : 'Retail',
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: size.width * .02),
                            Text(
                              'Quantity : ${orderdoc['quantity']}',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: size.width * .02),
                            Text(
                              'Total Price : Rs.${orderdoc['totalprice']}',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: size.width * .02),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text('Ordered by Customer : ${custdoc['name']}',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(height: size.width * .02),
                  Text('PIN Code : ${custdoc['pincode']}',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(height: size.width * .02),
                  Container(
                      width: size.width * .75,
                      child: Text('Address :\n\t${custdoc['address']}',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))),
                  SizedBox(height: size.width * .02),
                  Text('Phone No : +91 ${custdoc['phone']}',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(height: size.width * .02),
                  Text('Ordered Time : $orderdatetime',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(height: size.width * .02),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatMessagePage(
                                            id: custdoc.id,
                                            name: custdoc['name']!,
                                            passingdocument: custdoc,
                                          )));
                            },
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            child: const Text(
                              'Chat with Customer',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: visibility,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {
                                db
                                    .collection('Orders')
                                    .doc(orderdoc.id)
                                    .update({'status': 's'});
                              },
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              child: const Text(
                                'Order Complete',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: visibility,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () {
                                db
                                    .collection('Orders')
                                    .doc(orderdoc.id)
                                    .update({'status': 'c'});
                              },
                              style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              child: const Text(
                                'Order Cancel',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
