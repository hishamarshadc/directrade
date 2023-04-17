import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/presentation/customer/screens/search_catergory/widgets/product_full_view.dart';
// import 'package:sample_project/presentation/customer/screens/search_catergory/widgets/product_full_view.dart';

class CustHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: const Text(
            'DirecTrade',
            style: TextStyle(
              fontSize: 27,
            ),
          ),
          actions: [
            InkWell(
            onTap: () => {Navigator.pushNamed(context, 'custprofile')},
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              child: Icon(
                Icons.person_pin,
                size: 30,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          )
          ]
          ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              height: 150,
              child: 
                     Container(
                      width: 400,
                      child: Card(
                        child: Container(
                          child: Image.asset(
                            'assets/images/slogan logo.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        clipBehavior: Clip.antiAlias,
                      ),
                    ),
                  
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Popular Product",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontWeight: FontWeight.bold),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: StreamBuilder(
              stream:FirebaseFirestore.instance.collection('Products').where('status',isEqualTo: 'active').orderBy('rating',descending: true).snapshots(),
              builder:(context, snapshot) {
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
                          return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                  DocumentSnapshot document=snapshot.data!.docs[index];

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
                                        // child: CircularProgressIndicator(
                                        //     color: Colors.blue),
                                      );
                                    }

                                    if (!snapshot.hasData) {
                                      return Text('Document does not exist');
                                    }
                                    // Extract data from the snapshot and display it
                                    final sellerdata = snapshot.data!;
                                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductFullViewPage(
                          passingdocument: document,
                          sellerdata:sellerdata ,
                          minQuantity: int.parse(
                                                document['min_quantity']),
                        ),
                        ),
                      ),
                      child: Column(
                        children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: 8, left: 8, top: 0, bottom: 0),
                              width: 100,
                              height: 100,
                              decoration:  BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14)),
                                color: Colors.black,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      document['image_url']),
                                     fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          
                          const SizedBox(
                            height: 10,
                          ),
                           Text(document['product_name']),
                          const SizedBox(
                            height: 8,
                          ),
                          Text('Rs.${document['product_price']} /-',style: TextStyle(fontSize: 11,fontWeight:FontWeight.bold,),),
                        ],
                      ),
                    );
                  });
                  }
                  );
                        }
                        else{
                          return Center(
                            child: const Text(
                              'No Products',
                            ),
                          );
                        }
              }

              } 
              )
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "New Product",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontWeight: FontWeight.bold),
                  )),

                ],
              ),
            ),
            SizedBox(
              height: 150,
              child:StreamBuilder(
              stream:FirebaseFirestore.instance.collection('Products').where('status',isEqualTo: 'active').orderBy('upload_time',descending: true).snapshots(),
              builder:(context, snapshot) {
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
                          return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                  DocumentSnapshot document=snapshot.data!.docs[index];

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
                                        // child: CircularProgressIndicator(
                                        //     color: Colors.blue),
                                      );
                                    }

                                    if (!snapshot.hasData) {
                                      return Text('Document does not exist');
                                    }
                                    // Extract data from the snapshot and display it
                                    final sellerdata = snapshot.data!;
                                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductFullViewPage(
                          passingdocument: document,
                          sellerdata:sellerdata ,
                          minQuantity: int.parse(
                                                document['min_quantity']),
                        ),
                        ),
                      ),
                      child: Column(
                        children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: 8, left: 8, top: 0, bottom: 0),
                              width: 100,
                              height: 100,
                              decoration:  BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14)),
                                color: Colors.black,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      document['image_url']),
                                     fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          
                          const SizedBox(
                            height: 10,
                          ),
                           Text(document['product_name']),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text('Rs.${document['product_price']} /-',style: TextStyle(fontSize: 11,fontWeight:FontWeight.bold,),),
                              
                            ],
                          ),
                        ],
                      ),
                    );
                  });
                  }
                  );
                        }
                        else{
                          return Center(
                            child: const Text(
                              'No Products',
                            ),
                          );
                        }
              }

              } 
              )
            ),
          ],
        ),
      ),
    );
  }
}
