import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/presentation/customer/screens/search_catergory/widgets/product_full_view.dart';
import 'package:sample_project/presentation/customer/screens/search_catergory/widgets/product_tile.dart';
import 'package:sample_project/presentation/customer/screens/search_catergory/widgets/search_tile.dart';

class SearchProductPage extends StatefulWidget {
  const SearchProductPage({super.key});

  @override
  State<SearchProductPage> createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  String _search = '';
  @override
  Widget build(BuildContext context) {

    dynamic streamSearch =
        FirebaseFirestore.instance.collection("Products").snapshots();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                onChanged: (value) => setState(() {
                  _search = value;
                }),
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search, color: Colors.black),
                  label: const Text(
                    'Search Product',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: StreamBuilder<QuerySnapshot>(
                  stream: streamSearch,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
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
                          return ListView.builder(itemCount:snapshot.data!.docs.length,
                          itemBuilder:(context, index) {
                            DocumentSnapshot document =
                                    snapshot.data!.docs[index];
                                var data =
                                    snapshot.data!.docs[index].data() as Map<String,dynamic>;
                                if(_search.isEmpty)
                                {
                                  return StreamBuilder<DocumentSnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('Users')
                                      .doc(document['product_seller_id'])
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<DocumentSnapshot>
                                          snapshot) {
                                    if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    }

                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(
                                            color: Colors.blue),
                                      );
                                    }

                                    if (!snapshot.hasData) {
                                      return Text('Document does not exist');
                                    }
                                    // Extract data from the snapshot and display it
                                    final sellerdata = snapshot.data!;
                                    return InkWell(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductFullViewPage(
                                            passingdocument: document,
                                            sellerdata: sellerdata,
                                            minQuantity: int.parse(
                                                document['min_quantity']),
                                          ),
                                        ),
                                      ),
                                      child: SearchTile(
                                        passingdocument: document,
                                      ),
                                    );
                                  },
                                );
                                }

                                if(document['product_name'].toString().toLowerCase().startsWith(_search.toLowerCase())){
                                  print(data['product_name']);
                                  print(_search);
                                    return StreamBuilder<DocumentSnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('Users')
                                      .doc(document['product_seller_id'])
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<DocumentSnapshot>
                                          snapshot) {
                                    if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    }

                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(
                                            color: Colors.blue),
                                      );
                                    }

                                    if (!snapshot.hasData) {
                                      return Text('Document does not exist');
                                    }
                                    // Extract data from the snapshot and display it
                                    final sellerdata = snapshot.data!;

                                    print(sellerdata['name']);
                                    print(document['min_quantity']);
                                    return InkWell(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductFullViewPage(
                                            passingdocument: document,
                                            sellerdata: sellerdata,
                                            minQuantity: int.parse(
                                                document['min_quantity']),
                                          ),
                                        ),
                                      ),
                                      child: SearchTile(
                                        passingdocument: document,
                                      ),
                                    );
                                  },
                                );
                                }
                                return Container();
                          },);
                        } else {
                          return Center(
                            child: const Text(
                              'No Product Items',
                            ),
                          );
                        }
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

