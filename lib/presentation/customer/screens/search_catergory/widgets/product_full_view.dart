import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sample_project/core/colors/Colors.dart';
import 'package:sample_project/presentation/user_model.dart';

class ProductFullViewPage extends StatelessWidget {
  ProductFullViewPage(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.productPrice});

  String title;
  String imageUrl;
  String productPrice;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('DirecTrade'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  children: [
                    //Image Product
                  AspectRatio(
            aspectRatio: 4/3,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
                   
                    //Product Hero
                    Row(
                      children: [
                        //ProductName
                        Column(
                          children: [
                            Text('Color Threads for Embroidary',),
                            Text('Sold by Awesome Designers',),
                            //rating row
                            Row(
                              children: [
                                Icon(Icons.star,color: Colors.amber,),
                                Text('4.5 ( 15 Ratings )'),
                              ],
                            )
                          ],
                        ),
                        //Price
                        Column(
                         children: [
                           Text('Rs.999 /-'),
                           Container(
                              width: size.width*.4,
                              height: size.width*.1,
                              child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child:const Text('Chat with Seller',style: TextStyle(color: textColor),) 
                              ),
                            ),
                         ],
                        ),
                      ],
                    ),
                    //Product Desc
                    Container(
                    decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20)),
                    child: ExpansionTile(
                         title: const Text('Product Discription'),
                        
                        children: [
                Column(
                  children: [
                    
                    Text('''
Awesome Designers provide high quality stitching threads at a lower price,
the product bundle consists the folowing :-
- 5 different colours of threads 
- Colors provided are Red,Blue,Yellow,White,Black
Suitble for crochet designing
Free Delivery Provided for Awesome Designer products

'''),
                    
                  ],
                ),
                        ],
                    ),
                  )
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: size.width*.2,
            decoration: BoxDecoration(
              color: Colors.amber,
            ),
            child: 
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child:const Icon(LineAwesomeIcons.minus,color: Colors.black,), 
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text('15',style: TextStyle(color: textColor,fontSize:18)),
                        ),
                        ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child:const Icon(LineAwesomeIcons.plus,color: Colors.black,), 
                        ),
                        Spacer(),
                        Container(
                          width: size.width*.4,
                          height: size.width*.1,
                          child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child:const Text('Order',style: TextStyle(color: textColor),) 
                          ),
                        ),

                    ],
                  ),
                ),
          )
        ],
      ),
    );
  }
}
