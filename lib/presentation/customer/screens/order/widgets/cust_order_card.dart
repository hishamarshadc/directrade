import 'package:flutter/material.dart';
import 'package:sample_project/presentation/user_model.dart';

class CustOrderCard extends StatelessWidget {
  const CustOrderCard({required this.index,super.key});
  final int index;
  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;
    return   Container(
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
                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                        color: Colors.blue.shade200,
                        image: DecorationImage(
                          image: AssetImage(products[0]['productImgUrl']!),
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
                            width: size.width*.35,
                            child: Text(
                              products[0]['productName']!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
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
                                (products[0]['productSellType'] == 'w')
                                    ? 'Wholesale'
                                    : 'Retail',
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: size.width*.02),
                          const Text(
                            'Quantity : 5',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: size.width*.02),
                          const Text(
                            'Status : Pending',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: size.width*.02),
                          const Text(
                            'Total Price : Rs.99',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                      SizedBox(height: size.width*.02),
                    ],
                  ),
                )
              ],
            ),
            const Text('Sold By : Hisham Arshad',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            SizedBox(height: size.width*.02),
            const Text('PIN Code : 673019',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            SizedBox(height: size.width*.02),
            const Text('Shop Address :\n\tGiven full address with lots of details must be given here',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            SizedBox(height: size.width*.02),
            const Text('Ordered Time : 10.00 AM 12 Jan 2023',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            SizedBox(height: size.width*.02),
            Row(
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
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          child: const Text(
                            'Rate Order',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                            OutlinedButton(
                            onPressed: () {},
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
        ),
      ),
    );
  }
}