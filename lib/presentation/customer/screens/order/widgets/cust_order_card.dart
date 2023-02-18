import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/presentation/user_model.dart';

class CustOrderCard extends StatelessWidget {
  const CustOrderCard(
      {required this.orderdoc, required this.productdoc, super.key});
  final DocumentSnapshot orderdoc;
  final DocumentSnapshot productdoc;
  @override
  Widget build(BuildContext context) {

    final visibility=(orderdoc['status']=='s')?true:false;
    final size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(orderdoc['seller_id'])
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
          final sellerdoc = snapshot.data!;
         
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
                                image:
                                    AssetImage(products[0]['productImgUrl']!),
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
                            Row(
                              children: [
                                Container(
                                  width: size.width * .35,
                                  child: Text(
                                    productdoc['product_name'],
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(fontSize: 18),
                                  ),
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
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: size.width * .02),
                            Text(
                              (orderdoc['status']=='s')?'Status : Success':(orderdoc['status']=='p')?'Status : Pendig':'Status : Cancelled',
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
                   Text('Sold By : Hisham Arshad',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(height: size.width * .02),
                   Text('PIN Code : 673019',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(height: size.width * .02),
                   Text(
                      'Shop Address :\n\t${sellerdoc['address']}',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(height: size.width * .02),
                  const Text('Ordered Time : 10.00 AM 12 Jan 2023',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(height: size.width * .02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: const Text(
                          'Contact Seller',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      Visibility(
                        visible: visibility,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          child: const Text(
                            'Rate Order',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: !visibility,
                        child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.red),
                            ),),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
