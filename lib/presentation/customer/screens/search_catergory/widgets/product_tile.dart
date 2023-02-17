import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.passingdocument,
    // required this.price,
    // required this.productname,
    // this.rating = 4.5 ,
    // this.ratingcount = 25,
    required this.imageUrl
  }) : super(key: key);

  // final Size size;
  final DocumentSnapshot passingdocument;
  final String imageUrl;
  // final String productname;
  // final int price;
  // final double ratingcount;
  // final double rating;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: size.width * .4,
            height: size.width * .4,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.blue.shade200,
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            passingdocument['product_name'],
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(passingdocument['rating'],style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                    const Icon(
                      Icons.star_sharp,
                      size: 17,
                      color: Colors.yellow,
                    )
                  ],
                ),
              ),
              Text(
                'Rs.${passingdocument['product_price']}/-',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
    // return Column(
    //   children: [
    //     Container(
    //       margin: EdgeInsets.only(right: 8, left: 8, top: 0, bottom: 0),
    //       width: size.width * .25,
    //       height: size.width * .25,
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.all(Radius.circular(20)),
    //         color: Colors.blue.shade200,
    //         image: const DecorationImage(
    //           image: AssetImage("assets/images/decorators.jpeg"),
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //     ),
    //     const SizedBox(
    //       height: 10,
    //     ),
    //     Text(productname),
    //     const SizedBox(
    //       height: 8,
    //     ),
    //     Text(
    //       'Rs.$price/-',
    //       style: TextStyle(
    //         fontSize: 11,
    //         fontWeight: FontWeight.bold,
    //       ),
    //     ),
    //     Container(
    //       width: 50,
    //       height: 20,
    //       decoration: BoxDecoration(
    //         color: Colors.blueAccent,
    //         borderRadius: BorderRadius.circular(2)
    //       ),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: [
    //           Text('$rating'),
    //           Icon(Icons.star_sharp,size: 15,color: Colors.yellow,)
    //         ],
    //       ),
    //     )
    //   ],
    // );
  }
}
