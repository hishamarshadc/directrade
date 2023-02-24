import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewProdPage extends StatefulWidget {
  ViewProdPage({super.key, required this.sellerId});
  String sellerId;

  @override
  State<ViewProdPage> createState() => _ViewProdPageState();
}

class _ViewProdPageState extends State<ViewProdPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Products')
          .where('product_seller_id', isEqualTo: widget.sellerId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              '${snapshot.error}',
            ),
          );
        }
        if(snapshot.connectionState==ConnectionState.waiting){
          Center(
              child: CircularProgressIndicator(),
          );
        }
        return Text('cycle');
      },
    );
  }
}
