import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/presentation/admin/screens/approvals/widgets/edit_card.dart';

class SellerEditsPage extends StatelessWidget {
  const SellerEditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Changes")

          // .where('userType', isEqualTo: 'p')
          .snapshots(),
          
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            );
          default:
            if (snapshot.data!.docs.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.only(
                    bottom: 15, left: 10, right: 10, top: 15),
                child: ListView.separated(
                    itemCount: snapshot.data!.docs.length,
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    itemBuilder: (context, index) {
                      DocumentSnapshot document1 = snapshot.data!.docs[index];
                      return SellerEditCard(
                        passingdocument: document1,
                      );
                    }),
              );
            } else {
              return Center(
                child: const Text(
                  'empty',
                ),
              );
            }
        }
      },
    );
  }
}
