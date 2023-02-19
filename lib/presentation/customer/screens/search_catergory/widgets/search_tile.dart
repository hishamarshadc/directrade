import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchTile extends StatelessWidget {
  SearchTile({super.key, required this.passingdocument});
  DocumentSnapshot passingdocument;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: size.width * .5,
                    height: size.width*.1,
                    child: Text(
                      passingdocument['product_name'],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    width: size.width * .35,
                    height: size.width*.1,
                    child: Text(
                      'Rs.${passingdocument['product_price']}/-',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: size.width * .15,
                        height: size.width * .08,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star_sharp,
                              size: 12,
                              color: Colors.yellow,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              '${passingdocument['rating']}',
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width*.1,
                      ),
                      Container(
                        width: size.width * .2,
                        height: size.width * .08,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            (passingdocument['sell_type'] == 'w')
                                ? 'Wholesale'
                                : 'Retail',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
