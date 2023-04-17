
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/core/fetchData.dart';

final store = FirebaseFirestore.instance;

getData(String a) {
  final docRef = store.collection("Users").doc("eUX17M7RtofTrdgnH4evkuqfpTk1");
  docRef.get().then(
    (DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      // ...
      return data['email'];
    },
    onError: (e) => print("Error getting document: $e"),
  );
}






class DataFetch extends StatelessWidget {
  const DataFetch({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Container(
        color: Colors.blue,
        child: TextButton(
            child: Text("Click"),
            onPressed: (() {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return fetchData();
                },
              ));
              // getData();
            })),
      ),
    ));
  }
}
