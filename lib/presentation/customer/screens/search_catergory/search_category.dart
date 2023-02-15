import 'package:flutter/material.dart';
import 'package:sample_project/presentation/customer/screens/search_catergory/widgets/product_full_view.dart';
import 'package:sample_project/presentation/customer/screens/search_catergory/widgets/product_tile.dart';
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

  final _catList = ['All Catogery','Fashion', 'Food','Others'];

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
final _productPriceList=[
  50,
  40,
  99,
  50,
  40,
  99,
  50,
  40,
  99,
  55
];
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: ksearch,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.search, color: Colors.black),
              label: const Text(
                'Search Products',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60),
              ),
            ),
          ),
        ),
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
            child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(10, (index) {
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductFullViewPage(
                          title: _productNameList[index],
                          imageUrl: _imageUrlList[index],
                          productPrice: products[0]['productPrice']!,
                        ),
                      ),
                    ),
                    child: ProductTile(
                      price: _productPriceList[index],
                      productname: _productNameList[index],
                      imageUrl: _imageUrlList[index],
                    ),
                  );
                })),
          ),
        ),
      ],
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
