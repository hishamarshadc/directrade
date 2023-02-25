// import 'package:flutter/material.dart';
// import 'package:sample_project/core/colors/Colors.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:sample_project/presentation/testdetails.dart';

// class CustCard extends StatelessWidget {
//   DocumentSnapshot passingdocument;
//   CustCard({Key? key, required this.passingdocument}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//             border: Border.all(color: Colors.black),
//             borderRadius: BorderRadius.circular(20)),
//         child: ExpansionTile(
//           leading: const CircleAvatar(
//               radius: 40, child: Icon(Icons.currency_rupee_outlined)),
//           title: Text(
//             '${passingdocument['name']}'.toUpperCase(),
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
//           ),
//           subtitle: Text(""),
//           children: [
//             Container(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('Full Name : ${passingdocument['name']}'),
//                   Text(
//                     'Personal Address : ${passingdocument['address']}',
//                     maxLines: 3,
//                   ),
//                   Text('PIN Code : ${passingdocument['pincode']}'),
//                   Text('Email ID : ${passingdocument['email']}'),
//                   Text('Phone No: ${passingdocument['phone']}'),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       ElevatedButton.icon(
//                           style: ButtonStyle(
//                             foregroundColor: MaterialStateProperty.all(Colors.red),
//                             backgroundColor:
//                                 MaterialStateProperty.all(Colors.white),
//                           ),
//                           onPressed: () => {
//                                 // set user type to removed customer
//                                 // store.collection("Users").doc(passingdocument.id).update({
//                                 //     'userType':'rc'})
//                               },
//                           icon: const Icon(Icons.close),
//                           label: const Text('Remove Customer')),
//                       ElevatedButton.icon(
//                           style: ButtonStyle(
//                             foregroundColor: MaterialStateProperty.all(Colors.blue),
//                             backgroundColor:
//                                 MaterialStateProperty.all(Colors.white),
//                           ),
//                           onPressed: () => {
//                                 // set user type to removed customer
//                                 // store.collection("Users").doc(passingdocument.id).update({
//                                 //     'userType':'rc'})
//                               },
//                           icon: const Icon(Icons.shopping_cart_outlined),
//                           label: const Text(' View Orders ')),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustCard extends StatelessWidget {
  final DocumentSnapshot passingdocument;

  CustCard({Key? key, required this.passingdocument}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ExpansionTile(
          leading: const CircleAvatar(
            radius: 40,
            child: Icon(Icons.currency_rupee_outlined),
          ),
          title: Text(
            '${passingdocument['name']}'.toUpperCase(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
          ),
          subtitle: Text(""),
          children: [
            buildCustomerDetails(context),
          ],
        ),
      ),
    );
  }

  Widget buildCustomerDetails(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(
                label: Text(
                  'Field',
                  style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                ),
              ),
              DataColumn(
                label: Text(
                  'Details',
                  style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                ),
              ),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text(
                    'Full Name',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
                  DataCell(Text(passingdocument['name'])),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text(
                    'Personal Address',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
                  DataCell(
                    Text(
                      passingdocument['address'],
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text(
                    'PIN Code',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
                  DataCell(Text(passingdocument['pincode'])),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text(
                    'Email ID',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
                  DataCell(Text(passingdocument['email'])),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text(
                    'Phone No',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
                  DataCell(Text(passingdocument['phone'])),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButtonRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildButton(
          label: 'Remove Customer',
          icon: Icons.close,
          color: Colors.red,
          onPressed: () {
            // set user type to removed customer
            // store.collection("Users").doc(passingdocument.id).update({
            //     'userType':'rc'})
          },
        ),
        buildButton(
          label: 'View Orders',
          icon: Icons.shopping_cart_outlined,
          color: Colors.blue,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(color),
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
