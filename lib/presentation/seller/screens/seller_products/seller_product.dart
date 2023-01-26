import 'package:flutter/material.dart';
import 'package:sample_project/presentation/seller/screens/seller_products/widgets/seller_product_card.dart';
import 'package:sample_project/presentation/user_model.dart';

class SellerProductPage extends StatefulWidget {
  const SellerProductPage({super.key});

  @override
  State<SellerProductPage> createState() => _SellerProductPageState();
}

class _SellerProductPageState extends State<SellerProductPage> {
//TextEditingController ksearch = TextEditingController();
  String? catvalue = 'All Catogery';
  String? priceValue = 'Any Price';

  final _catList = ['All Catogery', 'Food', 'Hand Crafts'];

  final _priceList = ['Any Price', '< 500', '< 750', '< 1000', '> 1000'];

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
          showModalBottomSheet(
            context: context,
            //background color for modal bottom screen
            backgroundColor: Colors.yellow,
            //elevates modal bottom screen
            elevation: 20,
            // gives rounded corner to modal bottom screen
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
            ),
            builder: (BuildContext context) {
              // UDE : SizedBox instead of Container for whitespaces
              return SizedBox(
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text('Add Forms Here'),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Text("Add Product",
            style: TextStyle(
                fontSize: 16, letterSpacing: 2.2, color: Colors.green)),
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: TextFormField(
          //     controller: ksearch,
          //     decoration: InputDecoration(
          //       suffixIcon: const Icon(Icons.search, color: Colors.black),
          //       label: const Text(
          //         'Search Products',
          //         style: TextStyle(fontWeight: FontWeight.w500),
          //       ),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(60),
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            color: Colors.amber,
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
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                itemBuilder: (context, index) => SellerProductCard(
                  index: index,
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: products.length,
              ),
            ),
          )
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
