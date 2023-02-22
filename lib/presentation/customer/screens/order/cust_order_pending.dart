import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/presentation/customer/screens/order/widgets/cust_order_card.dart';

class CustOrderPendingPage extends StatelessWidget {
  const CustOrderPendingPage({super.key});
  


  @override
  Widget build(BuildContext context) {
    final user=FirebaseAuth.instance.currentUser;
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Orders")
          .where('customer_id', isEqualTo: user?.uid )
          .where('status',isEqualTo: 'p')
          .orderBy('datetime',descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            );
          default:
            if (snapshot.data!.docs.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(
                    bottom: 15, left: 10, right: 10, top: 15),
                child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot orderdoc = snapshot.data!.docs[index];
                      return StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('Products')
                              .doc(orderdoc['product_id'])
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.blue),
                              );
                            }

                            if (!snapshot.hasData) {
                              return Text('Document does not exist');
                            }
                            // Extract data from the snapshot and display it
                            final productdoc = snapshot.data!;

                            return CustOrderCard(orderdoc: orderdoc,productdoc: productdoc);
                          });
                    }),
              );
            } else {
              return Center(
                child: const Text(
                  'No Orders',
                ),
              );
            }
        }
      },
    );
  }
}


