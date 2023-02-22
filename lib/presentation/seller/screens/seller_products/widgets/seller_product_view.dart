import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sample_project/core/colors/Colors.dart';
import 'package:sample_project/presentation/seller/screens/seller_products/widgets/editproduct.dart';
import 'package:sample_project/presentation/user_model.dart';

class SellerProductView extends StatelessWidget {
  SellerProductView({super.key,required this.passingdocument});
  DocumentSnapshot passingdocument;
  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(
      height: 20,
    );

    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('DirecTrade'),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 15,left: 15 ,right: 15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //Image Product
                      AspectRatio(
                        aspectRatio: 3/3,
                        child: Image.network(
                          passingdocument['image_url']!,
                          fit: BoxFit.cover,
                        ),
                      ),

                      //Product Hero
                      Row(
                        children: [
                          //ProductName
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: size.width * .5,
                                    child: Text(
                                      passingdocument['product_name']!,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    )),
                                SizedBox(
                                    width: size.width * .5,
                                    child: Text(
                                      'Sold by Awesome Designers',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    )),
                              ],
                            ),
                          ),
                          Spacer(),
                          //Price
                          Column(
                            children: [
                               Text(
                                'Rs.${passingdocument['product_price']!} /-',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              //rating row
                              Row(
                                children:  [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Text('${passingdocument['rating']!} ( ${passingdocument['rating_count']} Ratings )'),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),

                      //Product Desc
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.lightBlue),
                                borderRadius: BorderRadius.circular(10)),
                            child: Card(
                              elevation: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Product Description',style: TextStyle(fontSize: 20,fontWeight:FontWeight.w400),),
                                    sizedBox,
                                    Text('${passingdocument['description']}'),
                                    ],
                                ),
                              ),
                            )
                            //                   ExpansionTile(
                            //                        title: const Text('Product Discription'),
                            //                       children: [
                            //             Padding(
                            //               padding: const EdgeInsets.all(8.0),
                            //               child: Column(
                            //                 children: const [

                            //                     Text('''
                            // Awesome Designers provide high quality stitching threads at a lower price,
                            // the product bundle consists the folowing :-
                            // - 5 different colours of threads
                            // - Colors provided are Red,Blue,Yellow,White,Black
                            // Suitble for crochet designing
                            // Free Delivery Provided for Awesome Designer products

                            // '''),

                            //                 ],
                            //               ),
                            //             ),
                            //                       ],
                            //                   ),
                            ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: size.width*.9,
              height: size.width*.15,
              child: Container(
                width: size.width* .8,
                height: size.width * .2,
                // decoration: const BoxDecoration(
                //   color: Colors.lightBlue,
                // ),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => EditProductForm(
                          passingdocument:passingdocument,
                        ),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber.shade700,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: const Text(
                      'Edit Product',
                      style: TextStyle(color: textColor),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
