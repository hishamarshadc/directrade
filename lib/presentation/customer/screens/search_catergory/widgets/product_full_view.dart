

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sample_project/core/colors/Colors.dart';
import 'package:sample_project/presentation/authentication/login.dart';
import 'package:sample_project/presentation/chat/chat_message_page.dart';


class ProductFullViewPage extends StatefulWidget {
  final DocumentSnapshot passingdocument;
  final DocumentSnapshot sellerdata;
  
  int minQuantity;

  ProductFullViewPage(
      {super.key,
       required this.passingdocument,
       required this.sellerdata,
       required this.minQuantity,
      });
      
        
  @override
  State<ProductFullViewPage> createState() => _ProductFullViewPageState();
}

class _ProductFullViewPageState extends State<ProductFullViewPage> {


void decrement() {
    setState(() {
      if (widget.minQuantity > int.parse(widget.passingdocument['min_quantity'])) {
        widget.minQuantity--;
      }
    });
  }
  void increment() {
    setState(() {
      if (widget.minQuantity < int.parse(widget.passingdocument['max_quantity'])) {
        widget.minQuantity++;
      }
    });
  }

  @override
   Widget build(BuildContext context)  {  

    const sizedBox = SizedBox(
      height: 20,
    );
    
    final size = MediaQuery.of(context).size;
    
    
    
    print(widget.passingdocument['product_price']);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Text(
            'Product Details',
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //Image Product
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          widget.passingdocument['image_url'],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    //Product Hero
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          //ProductName
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: size.width * .55,
                                    child: Text(
                                      '${widget.passingdocument['product_name']}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    )),
                                SizedBox(
                                    width: size.width * .55,
                                    child: Text(
                                      'Sold by ${widget.sellerdata['companyname']}',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    )),
                              ],
                            ),
                          ),

                          //Price
                          Column(
                            children: [
                               Text(
                                'Rs.${widget.passingdocument['product_price']}/-',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              //rating row
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Text('${widget.passingdocument['rating'].toStringAsFixed(1)} ( ${widget.passingdocument['rating_count']} Ratings )'),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    //Chat Button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: size.width * .9,
                        height: size.width * .13,
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => ChatMessagePage(
                                            id:widget.sellerdata.id,
                                            name:widget.sellerdata['name'],
                                            passingdocument: widget.sellerdata,
                                      )));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            child: const Text(
                              'Chat with Seller',
                              style: TextStyle(color: textColor),
                            )),
                      ),
                    ),
                    //Product Desc
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:15,vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical:15,horizontal: 10),
                              child: const Text("Product Discription",style: TextStyle(fontSize: 20)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right:15,bottom: 10),
                              child: Text(widget.passingdocument['description']),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical:15,horizontal: 10),
                              child: const Text("Shop Address",style: TextStyle(fontSize: 20)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right:15,bottom: 10),
                              child: Text(widget.sellerdata['address']),
                            ),
                          ],
                        ), 
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: size.width * .2,
              decoration: const BoxDecoration(
                color: Colors.lightBlue,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: decrement,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber.shade700,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: const Icon(
                        LineAwesomeIcons.minus,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text('${widget.minQuantity}',
                          style: TextStyle(color: textColor, fontSize: 18)),
                    ),
                    ElevatedButton(
                      onPressed: increment,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber.shade700,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: const Icon(
                        LineAwesomeIcons.plus,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: size.width * .4,
                      height: size.width * .12,
                      child: ElevatedButton(
                          onPressed: () {
                            final firestore = FirebaseFirestore.instance;
                            final user= FirebaseAuth.instance.currentUser;
                            num totalprice = widget.minQuantity *widget.passingdocument['product_price']; 

                            firestore.collection('Orders').doc().set({
                                'customer_id':user?.uid,
                                'seller_id':widget.passingdocument['product_seller_id'],
                                'product_id':widget.passingdocument.id,
                                'datetime':DateTime.now(),
                                'status':'p',
                                'quantity':widget.minQuantity,
                                'totalprice': totalprice
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                     SnackBar(
                                      content: NewSnackbar(
                                        errortext:
                                            'Your Order is Placed\nCheckout your Orders!\nTotal Price : $totalprice',
                                        errorcolor: Colors.lightBlue,
                                      ),
                                      elevation: 0,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                    ),
                                  );

                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber.shade700,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          child: const Text(
                            'Order',
                            style: TextStyle(color: textColor),
                          )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
