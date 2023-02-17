import 'package:flutter/material.dart';
import 'package:sample_project/core/colors/Colors.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample_project/presentation/testdetails.dart';

class WaitingCard extends StatelessWidget {
  DocumentSnapshot passingdocument;
  WaitingCard({Key? key, required this.passingdocument}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {

    // var name = (passingdocument['name']);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20)),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.all(8),
          childrenPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          leading: const CircleAvatar(radius: 40, child: Icon(Icons.person)),
          title:  Text(
            "Seller Name : ${passingdocument['name']}",
            style: textStyleHead,
          ),
          subtitle:  Text(
            'Business Name : ${passingdocument['companyname']}',
            style: textStyleSubhead,
          ),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Business Address : ${passingdocument['address']}',
              style: subTextStyle,
            ),
            Text(
              'PIN Code : ${passingdocument['pincode']}',
              style: subTextStyle,
            ),
             Text(
              'Phone : ${passingdocument['phone']}',
              style: subTextStyle,
            ),
           Text(
              'Email ID : ${passingdocument['email']}',
              style: subTextStyle,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/images/seller.jpg',fit: BoxFit.cover,),
            ),
            SizedBox(height: size.width * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: () => {
                        store.collection("Users").doc(passingdocument.id).update({
                          'userType':'s',
                          'status':'a'
                        })
                    },
                    icon: const Icon(Icons.done),
                    label: const Text('Approve')),
                const SizedBox(width: 10),
                const Spacer(),
                ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () => {
                      store.collection("Users").doc(passingdocument.id).update({
                          'status':'r'
                        })
                    },
                    icon: const Icon(Icons.close),
                    label: const Text('Reject')),
                const Spacer()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
