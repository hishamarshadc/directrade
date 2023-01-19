import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    this.price = 100,
    this.productname = 'decorators',
    this.rating = 4.5,
    this.ratingcount = 20,
  }) : super(key: key);

  // final Size size;
  final String productname;
  final double price;
  final double ratingcount;
  final double rating;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 8, left: 8, top: 0, bottom: 0),
          width: size.width * .3,
          height: size.width * .3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.blue.shade200,
            image: const DecorationImage(
              image: AssetImage("assets/images/decorators.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(productname),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Rs.$price/-',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 50,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(2)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('$rating'),
              Icon(Icons.star_sharp,size: 15,color: Colors.yellow,)
            ],
          ),
        )
      ],
    );
  }
}