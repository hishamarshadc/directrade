import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/presentation/customer/screens/search_catergory/widgets/product_full_view.dart';
import 'package:sample_project/presentation/customer/screens/search_catergory/widgets/product_tile.dart';
import 'package:sample_project/presentation/customer/screens/search_catergory/widgets/search_product.dart';

class SearchAndCategoryPage extends StatefulWidget {
  const SearchAndCategoryPage({super.key});

  @override
  State<SearchAndCategoryPage> createState() => _SearchAndCategoryPageState();
}

class _SearchAndCategoryPageState extends State<SearchAndCategoryPage> {
  Stream<QuerySnapshot<Object?>>? stream;

  String? cat = '';
  num? price = 0;
  String? type = 'r';
  // String? catvalue = 'Any Category';
  String? priceValue = 'All Price';

  // final _catList = ['Any Category', 'Fashion', 'Food', 'Others'];

  // final _priceList = ['All Price', '< Rs.500', '< Rs.1000', '> Rs.1000'];

  @override
  Widget build(BuildContext context) {
    if (cat == '') {
      if (price == 0) {
        (type == 'w')
            ? stream = FirebaseFirestore.instance
                .collection("Products")
                .where('sell_type', isEqualTo: 'w')
                .snapshots()
            : stream = FirebaseFirestore.instance
                .collection("Products")
                .where('sell_type', isEqualTo: 'r')
                .snapshots();
      } else if (price == 1) {
        (type == 'w')
            ? stream = FirebaseFirestore.instance
                .collection("Products")
                .where('product_price', isGreaterThan: 1000)
                .where('sell_type', isEqualTo: 'w')
                .snapshots()
            : stream = FirebaseFirestore.instance
                .collection("Products")
                .where('product_price', isGreaterThan: 1000)
                .where('sell_type', isEqualTo: 'r')
                .snapshots();
      } else {
        (type == 'w')
            ? stream = FirebaseFirestore.instance
                .collection("Products")
                .where('product_price', isLessThan: price)
                .where('sell_type', isEqualTo: 'w')
                .snapshots()
            : stream = FirebaseFirestore.instance
                .collection("Products")
                .where('product_price', isLessThan: price)
                .where('sell_type', isEqualTo: 'r')
                .snapshots();
      }
    } else if (cat!.isNotEmpty) {
      if (price == 0) {
        // stream = FirebaseFirestore.instance
        //     .collection("Products")
        //     .where('category', isEqualTo: cat)
        //     .snapshots();
        (type == 'w')
            ? stream = FirebaseFirestore.instance
                .collection("Products")
                .where('category', isEqualTo: cat)
                .where('sell_type', isEqualTo: 'w')
                .snapshots()
            : stream = FirebaseFirestore.instance
                .collection("Products")
                .where('category', isEqualTo: cat)
                .where('sell_type', isEqualTo: 'r')
                .snapshots();
      } else if (price == 1) {
        (type == 'w')
            ? stream = FirebaseFirestore.instance
                .collection("Products")
                .where('category', isEqualTo: cat)
                .where('product_price', isGreaterThan: 1000)
                .where('sell_type', isEqualTo: 'w')
                .snapshots()
            : stream = FirebaseFirestore.instance
                .collection("Products")
                .where('category', isEqualTo: cat)
                .where('product_price', isGreaterThan: 1000)
                .where('sell_type', isEqualTo: 'r')
                .snapshots();
      } else {
        (type == 'w')
            ? stream = FirebaseFirestore.instance
                .collection("Products")
                .where('category', isEqualTo: cat)
                .where('product_price', isLessThan: price)
                .where('sell_type', isEqualTo: 'w')
                .snapshots()
            : stream = FirebaseFirestore.instance
                .collection("Products")
                .where('category', isEqualTo: cat)
                .where('product_price', isLessThan: price)
                .where('sell_type', isEqualTo: 'r')
                .snapshots();
      }
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
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
              backgroundColor: Colors.green,
              backgroundImage: AssetImage('assets/images/seller.jpg'),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
          child: Icon(
            Icons.search_rounded,
            size: 30,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchProductPage(),
              ),
            );
          }),
      body: Column(
        children: [
          // Container(
          //   color: Colors.amber,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       const Text(
          //         'Filters',
          //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //       ),
          //       Container(
          //         width: MediaQuery.of(context).size.width * 0.3,
          //         margin: const EdgeInsets.only(left: 10),
          //         child: DropdownButton<String>(
          //           hint: const Text('Category'),
          //           onChanged: (value) {},
          //           items: _catList.map((item) {
          //             return DropdownMenuItem<String>(
          //               value: item,
          //               child: Text(
          //                 item,
          //                 style: const TextStyle(fontSize: 15),
          //               ),
          //             );
          //           }).toList(),
          //         ),
          //       ),
          //       Container(
          //         width: MediaQuery.of(context).size.width * 0.3,
          //         margin: const EdgeInsets.only(left: 10),
          //         child: DropdownButton<String>(
          //           hint: const Text('Price'),
          //           onChanged: (value) {},
          //           items: _priceList.map((item) {
          //             return DropdownMenuItem<String>(
          //               value: item,
          //               child: Text(
          //                 item,
          //                 style: const TextStyle(fontSize: 15),
          //               ),
          //             );
          //           }).toList(),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            color: Colors.lightBlue,
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 20),
                  const Text(
                    'Filters : ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    margin: const EdgeInsets.only(left: 10),
                    child: DropdownButton(
                      // hint: const Text('Category'),
                      value: cat,
                      items: [
                        DropdownMenuItem(
                          child: Text('All Category'),
                          value: '',
                        ),
                        DropdownMenuItem(
                          child: Text('Fashion'),
                          value: 'fashion',
                        ),
                        DropdownMenuItem(
                          child: Text('Food'),
                          value: 'food',
                        ),
                        DropdownMenuItem(
                          child: Text('Others'),
                          value: 'others',
                        ),
                      ],
                      onChanged: (value) => setState(() {
                        cat = value;
                      }),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    margin: const EdgeInsets.only(left: 10),
                    child: DropdownButton<String>(
                      // hint: const Text('Category'),
                      items: [
                        DropdownMenuItem(
                          child: Text('Any Price'),
                          value: '0',
                        ),
                        DropdownMenuItem(
                          child: Text('Less than 500'),
                          value: '500',
                        ),
                        DropdownMenuItem(
                          child: Text('Less than 1000'),
                          value: '1000',
                        ),
                        DropdownMenuItem(
                          child: Text('Greater than 1000'),
                          value: '1',
                        ),
                      ],
                      value: price.toString(),
                      onChanged: (value) => setState(() {
                        price = num.parse(value!);
                      }),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    margin: const EdgeInsets.only(left: 10),
                    child: DropdownButton(
                      // hint: const Text('Sale Type'),
                      value: type,
                      items: [
                        DropdownMenuItem(
                          child: Text('Retail'),
                          value: 'r',
                        ),
                        DropdownMenuItem(
                          child: Text('Wholesale'),
                          value: 'w',
                        ),
                      ],
                      onChanged: (value) => setState(() {
                        type = value;
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: StreamBuilder<QuerySnapshot>(
                stream: stream,
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
                        return GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: 3 / 4,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            children: List.generate(snapshot.data!.docs.length,
                                (index) {
                              DocumentSnapshot document =
                                  snapshot.data!.docs[index];
                              return StreamBuilder<DocumentSnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('Users')
                                    .doc(document['product_seller_id'])
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<DocumentSnapshot> snapshot) {
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
                                    child: ProductTile(
                                      passingdocument: document,
                                    ),
                                  );
                                },
                              );
                            }));
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

              //ListView.separated(itemCount: snapshot.data!.docs.length,
              // separatorBuilder: (context, index) =>
              //     const SizedBox(
              //       height: 10,
              //     ),
              // itemBuilder: (context, index) {
              //   DocumentSnapshot document =
              //       snapshot.data!.docs[index];
              //   return ProductTile(
              //     passingdocument: document,
              //     price: _productPriceList[index],
              //     productname: _productNameList[index],
              //     imageUrl: _imageUrlList[index],
              //   );
              // }),

              // child: GridView.count(
              //     crossAxisCount: 2,
              //     childAspectRatio: 3 / 4,
              //     mainAxisSpacing: 10,
              //     crossAxisSpacing: 10,
              // children: List.generate(snapshot.data!.docs.length, (index) {
              //       return InkWell(
              //         onTap: () => Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => ProductFullViewPage(
              //               title: _productNameList[index],
              //               imageUrl: _imageUrlList[index],
              //               productPrice: products[0]['productPrice']!,
              //             ),
              //           ),
              //         ),
              //         child: ProductTile(
              //           price: _productPriceList[index],
              //           productname: _productNameList[index],
              //           imageUrl: _imageUrlList[index],
              //         ),
              //       );
              //     })),
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontSize: 15),
        ),
      );
}
