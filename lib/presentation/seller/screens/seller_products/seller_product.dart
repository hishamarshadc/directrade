import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/presentation/admin/screens/view_users/widgets/seller_card.dart';
import 'package:sample_project/presentation/seller/screens/seller_products/widgets/addproduct.dart';
import 'package:sample_project/presentation/seller/screens/seller_products/widgets/seller_product_card.dart';
import 'package:sample_project/presentation/user_model.dart';

final user = FirebaseAuth.instance.currentUser;

class SellerProductPage extends StatefulWidget {
  const SellerProductPage({super.key});

  @override
  State<SellerProductPage> createState() => _SellerProductPageState();
}

class _SellerProductPageState extends State<SellerProductPage> {
  Stream<QuerySnapshot<Object?>>? stream;

  String? cat = '';
  num? price = 0;
  String? type = 'r';
  String? priceValue = 'All Price';

//TextEditingController ksearch = TextEditingController();
  // String? catvalue = 'All Catogery';
  // String? priceValue = 'Any Price';

  // final _catList = ['All Catogery', 'Food', 'Hand Crafts'];

  // final _priceList = ['Any Price', '< 500', '< 750', '< 1000', '> 1000'];

  // final _productNameList = [
  //   'Paper Bags',
  //   'Gift Wrappings',
  //   'Embroidary Threads',
  //   'Paper Bags',
  //   'Gift Wrappings',
  //   'Embroidary Threads',
  //   'Paper Bags',
  //   'Gift Wrappings',
  //   'Embroidary Threads',
  //   'Penholder Paper Craft'
  // ];

  // final _imageUrlList = [
  //   'assets/images/decorators.jpeg',
  //   'assets/images/gift wrappings.jpeg',
  //   'assets/images/color threads.jpeg',
  //   'assets/images/decorators.jpeg',
  //   'assets/images/gift wrappings.jpeg',
  //   'assets/images/color threads.jpeg',
  //   'assets/images/decorators.jpeg',
  //   'assets/images/gift wrappings.jpeg',
  //   'assets/images/color threads.jpeg',
  //   'assets/images/pencilholder.jpeg'
  // ];

  // final _productPriceList = [50, 40, 99, 50, 40, 99, 50, 40, 99, 55];

  @override
  Widget build(BuildContext context) {
    if (cat == '') {
      if (price == 0) {
        (type == 'w')
            ? stream = FirebaseFirestore.instance
                .collection("Products")
                .where('product_seller_id', isEqualTo: user!.uid)
                .where('sell_type', isEqualTo: 'w')
                .snapshots()
            : stream = FirebaseFirestore.instance
                .collection("Products")
                .where('product_seller_id', isEqualTo: user!.uid)
                .where('sell_type', isEqualTo: 'r')
                .snapshots();
      } else if (price == 1) {
        (type == 'w')
            ? stream = FirebaseFirestore.instance
                .collection("Products")
                .where('product_seller_id', isEqualTo: user!.uid)
                .where('product_price', isGreaterThan: 1000)
                .where('sell_type', isEqualTo: 'w')
                .snapshots()
            : stream = FirebaseFirestore.instance
                .collection("Products")
                .where('product_seller_id', isEqualTo: user!.uid)
                .where('product_price', isGreaterThan: 1000)
                .where('sell_type', isEqualTo: 'r')
                .snapshots();
      } else {
        (type == 'w')
            ? stream = FirebaseFirestore.instance
                .collection("Products")
                .where('product_seller_id', isEqualTo: user!.uid)
                .where('product_price', isLessThan: price)
                .where('sell_type', isEqualTo: 'w')
                .snapshots()
            : stream = FirebaseFirestore.instance
                .collection("Products")
                .where('product_seller_id', isEqualTo: user!.uid)
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
                .where('product_seller_id', isEqualTo: user!.uid)
                .where('category', isEqualTo: cat)
                .where('sell_type', isEqualTo: 'w')
                .snapshots()
            : stream = FirebaseFirestore.instance
                .collection("Products")
                .where('product_seller_id', isEqualTo: user!.uid)
                .where('category', isEqualTo: cat)
                .where('sell_type', isEqualTo: 'r')
                .where('product_seller_id', isEqualTo: user!.uid)
                .snapshots();
      } else if (price == 1) {
        (type == 'w')
            ? stream = FirebaseFirestore.instance
                .collection("Products")
                .where('product_seller_id', isEqualTo: user!.uid)
                .where('category', isEqualTo: cat)
                .where('product_price', isGreaterThan: 1000)
                .where('sell_type', isEqualTo: 'w')
                .snapshots()
            : stream = FirebaseFirestore.instance
                .collection("Products")
                .where('product_seller_id', isEqualTo: user!.uid)
                .where('category', isEqualTo: cat)
                .where('product_price', isGreaterThan: 1000)
                .where('sell_type', isEqualTo: 'r')
                .snapshots();
      } else {
        (type == 'w')
            ? stream = FirebaseFirestore.instance
                .collection("Products")
                .where('product_seller_id', isEqualTo: user!.uid)
                .where('category', isEqualTo: cat)
                .where('product_price', isLessThan: price)
                .where('sell_type', isEqualTo: 'w')
                .snapshots()
            : stream = FirebaseFirestore.instance
                .collection("Products")
                .where('product_seller_id', isEqualTo: user!.uid)
                .where('category', isEqualTo: cat)
                .where('product_price', isLessThan: price)
                .where('sell_type', isEqualTo: 'r')
                .snapshots();
      }
    }

    return Scaffold(
      appBar: AppBar(
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
          IconButton(
            iconSize: 35,
            onPressed: () {
              Navigator.pushNamed(context, 'sellerprofile');
            },
            icon: const Icon(
              Icons.account_circle_outlined,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 50),
          shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 4,
                style: BorderStyle.solid,
                color: Colors.green,
              ),
              borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'addProdForm');
          //   showModalBottomSheet(
          //       context: context,
          //       //background color for modal bottom screen
          //       //elevates modal bottom screen
          //       elevation: 20,
          //       // gives rounded corner to modal bottom screen
          //       shape: const RoundedRectangleBorder(
          //         borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(30),
          //             topRight: Radius.circular(30)),
          //       ),
          //       builder: (BuildContext context) {
          //         return Padding(
          //           padding: EdgeInsets.all(20),
          //           child: AddProductForm(),
          //         );
          //       }

          //       //(BuildContext context) {
          //       //   // UDE : SizedBox instead of Container for whitespaces
          //       //   return SizedBox(
          //       //     height: 200,
          //       //     child: Center(
          //       //       child: Column(
          //       //         mainAxisAlignment: MainAxisAlignment.center,
          //       //         children: const <Widget>[
          //       //           AddProduct(),
          //       //         ],
          //       //       ),
          //       //     ),
          //       //   );
          //       // },
          //       );
        },
        child: const Text("Add Product",
            style: TextStyle(
                fontSize: 16, letterSpacing: 2.2, color: Colors.green)),
      ),
      body: Column(
        children: [
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
                padding: const EdgeInsets.all(10),
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
                          return ListView.separated(
                              itemCount: snapshot.data!.docs.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 10,
                                  ),
                              itemBuilder: (context, index) {
                                DocumentSnapshot document =
                                    snapshot.data!.docs[index];
                                return SellerProductCard(
                                  passingdocument: document,
                                );
                              });
                        } else {
                          return Center(
                            child: const Text(
                              'No Products',
                            ),
                          );
                        }
                    }
                  },
                )
                // ListView.separated(
                //   itemBuilder: (context, index) => SellerProductCard(
                //     index: index,
                //   ),
                //   separatorBuilder: (context, index) => const Divider(),
                //   itemCount: products.length,
                // ),
                ),
          ),

          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 10, right: 10),
          //     child: GridView.count(
          //         crossAxisCount: 2,
          //         childAspectRatio: 3 / 4,
          //         mainAxisSpacing: 10,
          //         crossAxisSpacing: 10,
          //         children: List.generate(10, (index) {
          //           return InkWell(
          //             onTap: () => Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => ProductFullViewPage(
          //                   title: _productNameList[index],
          //                   imageUrl: _imageUrlList[index],
          //                 ),
          //               ),
          //             ),
          //             child: ProductTile(
          //               price: _productPriceList[index],
          //               productname: _productNameList[index],
          //               imageUrl: _imageUrlList[index],
          //             ),
          //           );
          //         },),),
          //   ),
          // ),
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
