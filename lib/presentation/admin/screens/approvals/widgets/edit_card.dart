import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/core/colors/Colors.dart';

final user = FirebaseAuth.instance.currentUser;

// previous data databases and variables

// final olddatadb = FirebaseFirestore.instance;
// final olddatadoc = olddatadb.collection("Users").doc(user!.uid);
// var olddata;

// new data databases and variables

class SellerEditCard extends StatelessWidget {
  DocumentSnapshot passingdocument;
  SellerEditCard({super.key, required this.passingdocument});

  final auth = FirebaseAuth.instance.currentUser;
  final storeUser = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final newdatadb = FirebaseFirestore.instance;
    late var docid = passingdocument.id;
    final newdatadoc = newdatadb.collection("Users").doc(docid);
     var newdata;
    

    // old data

    // olddatadoc.get().then(
    //   (DocumentSnapshot doc) {
    //     olddata = doc.data() as Map<String, dynamic>;
    //     print(olddata);
    //   },
    //   onError: (e) => print("Error getting document: $e"),
    // );

    // new data

   newdatadoc.get().then(
      (DocumentSnapshot doc) async {
        newdata = await doc.data() as Map<String, dynamic>;
        print(newdata);
      },
      onError: (e) => print("Error getting document: $e"),
    );

    var olddata = passingdocument;
    print("!!!!!!!old!!!!!!!!!!!${olddata}!!!!!!!!!!!!!");
    print("!!!!!!!new!!!!!!!!!!!${newdata}!!!!!!!!!!!!!");

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
          title: Text(
            'Seller Name : ${olddata['name']}'.toUpperCase(),
            style: TextStyle(
                fontFamily: 'roboto',
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            'Business Name : ${olddata['companyname']}',
            style: TextStyle(
                fontFamily: 'roboto',
                fontSize: 16,
                fontWeight: FontWeight.w300),
          ),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Previous Details'.toUpperCase(),
                style: TextStyle(
                    color: Colors.red.shade500,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // Text(
            //   'Name : ${olddata['name']}',
            //   style: TextStyle(
            //     color: (olddata['name'] == newdata['name'])
            //         ? Colors.black
            //         : Colors.red,
            //   ),
            // ),
            // Text(
            //   'Business Address : ${olddata['companyname']}',
            //   style: TextStyle(
            //     color: (olddata['companyname'] == newdata['companyname'])
            //         ? Colors.black
            //         : Colors.red,
            //   ),
            // ),
            // Text(
            //   'PIN Code : ${olddata['pincode']}',
            //   style: TextStyle(
            //     color: (olddata['pincode'] == newdata['pincode'])
            //         ? Colors.black
            //         : Colors.red,
            //   ),
            // ),
            // Text(
            //   'Phone : ${olddata['phone']}',
            //   style: TextStyle(
            //     color: (olddata['phone'] == newdata['phone'])
            //         ? Colors.black
            //         : Colors.red,
            //   ),
            // ),
            // Text(
            //   'Email ID : ${olddata['email']}',
            //   style: TextStyle(
            //     color: (olddata['email'] == newdata['email'])
            //         ? Colors.black
            //         : Colors.red,
            //   ),
            // ),
            SizedBox(height: size.width * .02),
            Center(
              child: Text(
                'New Details'.toUpperCase(),
                style: TextStyle(
                    color: Colors.green.shade300,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // Text(
            //   'Name : ${newdata['name']}',
            //   style: TextStyle(
            //     color: (olddata['name'] == newdata['name'])
            //         ? Colors.black
            //         : Colors.green,
            //   ),
            // ),
            // Text(
            //   'Business Address : ${newdata['companyname']}',
            //   style: TextStyle(
            //     color: (olddata['companyname'] == newdata['companyname'])
            //         ? Colors.black
            //         : Colors.green,
            //   ),
            // ),
            // Text(
            //   'PIN Code : ${newdata['pincode']}',
            //   style: TextStyle(
            //     color: (olddata['pincode'] == newdata['pincode'])
            //         ? Colors.black
            //         : Colors.green,
            //   ),
            // ),
            // Text(
            //   'Phone : ${newdata['phone']}',
            //   style: TextStyle(
            //     color: (olddata['phone'] == newdata['phone'])
            //         ? Colors.black
            //         : Colors.green,
            //   ),
            // ),
            // Text(
            //   'Email ID : ${newdata['email']}',
            //   style: TextStyle(
            //     color: (olddata['email'] == newdata['email'])
            //         ? Colors.black
            //         : Colors.green,
            //   ),
            // ),
            SizedBox(height: size.width * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    onPressed: () => {},
                    icon: const Icon(Icons.done),
                    label: const Text('Approve')),
                const SizedBox(width: 10),
                const Spacer(),
                ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    onPressed: () => {},
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
