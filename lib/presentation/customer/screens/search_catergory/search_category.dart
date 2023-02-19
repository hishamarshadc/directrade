import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/presentation/customer/screens/search_catergory/widgets/product_full_view.dart';
import 'package:sample_project/presentation/customer/screens/search_catergory/widgets/product_tile.dart';
import 'package:sample_project/presentation/customer/screens/search_catergory/widgets/search_product.dart';
import 'package:sample_project/presentation/user_model.dart';

class SearchAndCategoryPage extends StatefulWidget {
  const SearchAndCategoryPage({super.key});

  @override
  State<SearchAndCategoryPage> createState() => _SearchAndCategoryPageState();
}

class _SearchAndCategoryPageState extends State<SearchAndCategoryPage> {
  TextEditingController ksearch = TextEditingController();

  String? catvalue = 'All Catogery';
  String? priceValue = 'Any Price';

  final _catList = ['All Catogery', 'Fashion', 'Food', 'Others'];

  final _priceList = ['Any Price', '< 500', '< 1000', '> 1000'];

  final _productNameList = [
    'Paper Bags',
    'Gift Wrappings',
    'Embroidary Threads',
    'Paper Bags',
    'Gift Wrappings',
    'Embroidary Threads',
    'Paper Bags',
    'Gift Wrappings',
    'Embroidary Threads',
    'Penholder Paper Craft'
  ];
  final _imageUrlList = [
    'assets/images/decorators.jpeg',
    'assets/images/gift wrappings.jpeg',
    'assets/images/color threads.jpeg',
    'assets/images/decorators.jpeg',
    'assets/images/gift wrappings.jpeg',
    'assets/images/color threads.jpeg',
    'assets/images/decorators.jpeg',
    'assets/images/gift wrappings.jpeg',
    'assets/images/color threads.jpeg',
    'assets/images/pencilholder.jpeg'
  ];
  final _productPriceList = [50, 40, 99, 50, 40, 99, 50, 40, 99, 55];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        child: Icon(Icons.search_rounded,size: 30,),
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(
                                        builder:(context) => SearchProductPage(),
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
                    width: MediaQuery.of(context).size.width * 0.3,
                    margin: const EdgeInsets.only(left: 10),
                    child: DropdownButton<String>(
                      // hint: const Text('Category'),
                      value: catvalue,
                      onChanged: (value) => setState(
                        () => catvalue = value,
                      ),
                      items: _catList.map(buildMenuItem).toList(),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    margin: const EdgeInsets.only(left: 10),
                    child: DropdownButton<String>(
                      // hint: const Text('Category'),
                      value: priceValue,
                      onChanged: (value) => setState(
                        () => priceValue = value,
                      ),
                      items: _priceList.map(buildMenuItem).toList(),
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
                stream: FirebaseFirestore.instance
                    .collection("Products")
                    // .where('category', isEqualTo: 'fashion')
                    // .where('product_price',isLessThan: 400)
                    // .where('product_name',isEqualTo: ksearch.text)
                    .snapshots(),
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
