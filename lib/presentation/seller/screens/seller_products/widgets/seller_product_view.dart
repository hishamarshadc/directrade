import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sample_project/core/colors/Colors.dart';
import 'package:sample_project/presentation/user_model.dart';

class SellerProductView extends StatelessWidget {
  const SellerProductView({super.key});

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
                        child: Image.asset(
                          products[0]['productImgUrl']!,
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
                                      'Color Threads for Embroidary',
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
                              const Text(
                                'Rs.999 /-',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              //rating row
                              Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Text('4.5 ( 15 Ratings )'),
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
                                    Text("Awesome Designers provide high quality stitching threads at a lower price,the product bundle consists the folowing : - 5 different colours of threads - Colors provided are Red,Blue,Yellow,White,Black Suitble for crochet designing Free Delivery Provided for Awesome Designer products")
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
                    onPressed: () {},
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
