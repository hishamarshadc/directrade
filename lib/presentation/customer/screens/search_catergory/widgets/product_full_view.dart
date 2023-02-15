import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sample_project/core/colors/Colors.dart';
import 'package:sample_project/presentation/customer/screens/chat/chat_message_page.dart';

class ProductFullViewPage extends StatefulWidget {
  ProductFullViewPage(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.productPrice});

  String title;
  String imageUrl;
  String productPrice;

  @override
  State<ProductFullViewPage> createState() => _ProductFullViewPageState();
}

class _ProductFullViewPageState extends State<ProductFullViewPage> {
    int prodQuantity = 1;
    int minQuantity  = 5;
    int maxQuantity = 10;

    void increment(){
      setState(() {
        if(prodQuantity<maxQuantity){
          prodQuantity++;
        }
      });
    }
    void decrement(){
      setState(() {
        if(prodQuantity>minQuantity){
          prodQuantity--;
        }
      });
    }
  @override
  Widget build(BuildContext context) {

    const sizedBox = SizedBox(
      height: 20,
    );
    
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text('Product Details',style: TextStyle(fontSize: 30),),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //Image Product
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: AspectRatio(
              aspectRatio: 4/3,
              child: Image.asset(
                widget.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
                    ),
                  ),
                   
                    //Product Hero
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          //ProductName
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 SizedBox(width:size.width*.55 ,child: Text('Color Threads for Embroidary',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)),
                                 SizedBox(width:size.width*.55,child: Text('Sold by Awesome Designers',style: TextStyle(fontSize:15, fontWeight: FontWeight.w500),)),
                                
                              ],
                            ),
                          ),
                         
                          //Price
                          Column(
                           children: [
                             const Text('Rs.999 /-',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              //rating row
                              Row(
                                children: const [
                                  Icon(Icons.star,color: Colors.amber,),
                                  Text('4.5 ( 15 Ratings )'),
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
                                width: size.width*.9,
                                height: size.width*.13,
                                child: ElevatedButton(
                                onPressed: () {
                                 Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> ChatMessagePage(personName: 'Seller Name',)));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30))),
                                child:const Text('Chat with Seller',style: TextStyle(color: textColor),) 
                                ),
                              ),
                    ),
                    //Product Desc
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                      decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10)),
                      child: ExpansionTile(
                           title: const Text('Product Discription'),
                          children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [
                        
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
              height: size.width*.2,
              decoration: const BoxDecoration(
                color: Colors.lightBlue,
              ),
              child: 
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed:decrement,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber.shade700,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          child:const Icon(LineAwesomeIcons.minus,color: Colors.black,), 
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text('$prodQuantity',style: TextStyle(color: textColor,fontSize:18)),
                          ),
                          ElevatedButton(
                          onPressed: increment,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber.shade700,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          child:const Icon(LineAwesomeIcons.plus,color: Colors.black,), 
                          ),
                          const Spacer(),
                          SizedBox(
                            width: size.width*.4,
                            height: size.width*.12,
                            child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber.shade700,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            child:const Text('Order',style: TextStyle(color: textColor),) 
                            ),
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
