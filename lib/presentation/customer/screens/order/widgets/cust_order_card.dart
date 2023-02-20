import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

class CustOrderCard extends StatelessWidget {
  const CustOrderCard(
      {required this.orderdoc, required this.productdoc, super.key});
  final DocumentSnapshot orderdoc;
  final DocumentSnapshot productdoc;

  @override
  Widget build(BuildContext context) {
    double rating = 0;
    String formatTimestamp(Timestamp timestamp) {
      var format =
          new DateFormat('hh:mm a dd MMM yyyy'); // <- use skeleton here
      return format.format(timestamp.toDate());
    }
    Widget buildRating() => RatingBar.builder(
        minRating: 1,
        itemSize: 40,
        updateOnDrag: true,
        itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
        onRatingUpdate: (value) {
          rating=value;
        }
        
        );

    showRating() => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Rate the Order'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Please leave a star rating',style: TextStyle(fontSize: 20),),
                buildRating(),
              ],
            ),
            actions: [
              TextButton(onPressed: (){
                num curr_rating = productdoc['rating'];
                num no_rating = productdoc['rating_count'];
                num curr_no = ++no_rating;
                num finalrating = ((curr_rating*no_rating)+rating)/(no_rating+1);
                print(finalrating);

                final db=FirebaseFirestore.instance;
                db.collection("Products").doc(orderdoc['product_id']) 
    .update({'rating' : finalrating,
    'rating_count':curr_no.toString()});
              db.collection("Orders").doc(orderdoc.id).update({'status':'r'});

              Navigator.pop(context);
    
              }, child: Text('OK',style: TextStyle(fontWeight: FontWeight.bold),))
            ],
          ),
        );

    String orderdatetime = formatTimestamp(orderdoc['datetime']);

    final visibility = (orderdoc['status'] == 's') ? true : false;
    final cVisibility = (orderdoc['status']=='p')?true:false;
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

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
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
                                  image: NetworkImage(
                                      productdoc['image_url']),
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
                                    width: size.width *.4,
                                    child: Text(
                                      productdoc['product_name'],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
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
                                (orderdoc['status'] == 's'||orderdoc['status']=='r')
                                    ? 'Status : Success'
                                    : (orderdoc['status'] == 'p')
                                        ? 'Status : Pending'
                                        : 'Status : Cancelled',
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
                    Text('Sold By : ${sellerdoc['companyname']}',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    SizedBox(height: size.width * .02),
                    Text('PIN Code : ${sellerdoc['pincode']}',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    SizedBox(height: size.width * .02),
                    Text('Shop Address :\n\t${sellerdoc['address']}',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    SizedBox(height: size.width * .02),
                    Text('Ordered Time : $orderdatetime',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    SizedBox(height: size.width * .02),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                            onPressed: () {
                              showRating();
                            },
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
                          visible: cVisibility,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
