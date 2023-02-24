import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.passingdocument,
  }) : super(key: key);

  final DocumentSnapshot passingdocument;
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
                image: NetworkImage(passingdocument['image_url']),
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
                    Text('${passingdocument['rating'].toStringAsFixed(1)}',style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
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
  }
}
