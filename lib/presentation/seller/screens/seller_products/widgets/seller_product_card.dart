import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/presentation/seller/screens/seller_products/widgets/seller_product_view.dart';
import 'package:sample_project/presentation/user_model.dart';

class SellerProductCard extends StatelessWidget {
  SellerProductCard({Key? key, required this.passingdocument}) : super(key: key);
DocumentSnapshot passingdocument;
//  List<String> sellerList=[
//       'Anshid O',
//       'Acee'

//  ]

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: size.width * .03),
                  Container(
                    width: size.width * .3,
                    height: size.width * .3,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.blue.shade200,
                      image: DecorationImage(
                        image: NetworkImage(passingdocument['image_url']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,left:10),
                      child: SizedBox(
                        width: size.width*.5,
                        child: Text(
                          passingdocument['product_name']!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    
                  ],
                ),
                SizedBox(height: size.width*.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  SizedBox(width: size.width * .03),
                    Container(
                      width: size.width*.35,
                      child: Text(
                        'Rs.${passingdocument['product_price']!}/unit',
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    
                  ],
                ),
                SizedBox(height: size.width*.015),
                Row(
                  children: [
                    SizedBox(width: size.width*.03,),
                      Container(
                      width: size.width * .2,
                      height: size.width * .06,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 5,),
                          const Icon(
                            Icons.star_sharp,
                            size: 12,
                            color: Colors.yellow,
                          ),
                          Expanded(
                            child: Text(
                              '${passingdocument['rating'].toStringAsFixed(1)!} (${passingdocument['rating_count']!})',
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: size.width*.09,),
                    Container(
                      width: size.width * .2,
                      height: size.width * .06,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          (passingdocument['sell_type'] =='w')
                              ? 'Wholesale'
                              : 'Retail',
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: size.width*.015),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SellerProductView(passingdocument: passingdocument),));
                      },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: const Text(
                        'Show Product',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    SizedBox(width:size.width * .03),
                    OutlinedButton(
                        onPressed: () {
                          final db=FirebaseFirestore.instance;
                          // db.collection('Products').doc(passingdocument.id).delete();
                        },
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ))
                  ],
                )
              ],
            )
            //   Column(
            //     // crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         products[index]['productName']!,
            //         overflow: TextOverflow.ellipsis,
            //         style: TextStyle(fontSize: 18),
            //       ),
            //       SizedBox(height: size.width * .02),
            //       Text(
            //         'Rs.${products[index]['productPrice']!}/unit',
            //         style: TextStyle(
            //             fontSize: 18, fontWeight: FontWeight.bold),
            //       ),
            //       SizedBox(width: size.width * .02),
            //     ],
            //   ),
            //   SizedBox(width: size.width * .02),
            //   Column(
            //     children: [
            // Container(
            //   width: size.width * .2,
            //   height: size.width * .06,
            //   decoration: BoxDecoration(
            //       color: Colors.blueAccent,
            //       borderRadius: BorderRadius.circular(5)),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       const Icon(
            //         Icons.star_sharp,
            //         size: 12,
            //         color: Colors.yellow,
            //       ),
            //       Text(
            //         '${products[index]['productRating']!} (${products[index]['productRatingCount']!})',
            //         style: const TextStyle(
            //             fontSize: 15, fontWeight: FontWeight.w400),
            //       ),
            //     ],
            //   ),
            // ),
            //       SizedBox(
            //         height: size.width * .04,
            //       ),
            // Container(
            //   width: size.width * .2,
            //   height: size.width * .06,
            //   decoration: BoxDecoration(
            //       color: Colors.green,
            //       borderRadius: BorderRadius.circular(5)),
            //   child: Center(
            //     child: Text(
            //       (products[index]['productSellType'] == 'w')
            //           ? 'Wholesale'
            //           : 'Retail',
            //       style: const TextStyle(
            //           fontSize: 15, fontWeight: FontWeight.w400),
            //     ),
            //   ),
            // )
            //     ],
            //   ),
            //       ],
            //     ),
            //   ],
            // ),
            // Row(
            //   children: [
            //     OutlinedButton(
            //       onPressed: () {},
            //       style: OutlinedButton.styleFrom(
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(50))),
            //       child: Text(
            //         'Show Product',
            //         style: TextStyle(color: Colors.blue),
            //       ),
            //     ),
            //     OutlinedButton(
            //         onPressed: () {},
            //         style: OutlinedButton.styleFrom(
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(50))),
            //         child: Icon(
            //           Icons.delete,
            //           color: Colors.red,
            //         ))
            //    Container(
            // width: size.width * .3,
            // height: size.width * .1,
            // decoration: BoxDecoration(
            //     color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            // child: Center(child: const Text('Show Product')),
            // ),
            // Container(
            //   width: size.width * .2,
            //   height: size.width * .1,
            //   decoration: BoxDecoration(
            //     border: BoxBorder(),
            //       color: Colors.red, borderRadius: BorderRadius.circular(10)),
            //   child: Center(child: Icon(Icons.delete)),
            // )
        
            // ElevatedButton(onPressed: (){},
            // style: ElevatedButton.styleFrom(
            //   backgroundColor: Colors.white,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10)
            //   )
            // ),
            // child: Icon(Icons.delete,color: Colors.red,) )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
