import 'package:flutter/material.dart';

class SearchAndCategoryPage extends StatefulWidget {
  const SearchAndCategoryPage({super.key});

  @override
  State<SearchAndCategoryPage> createState() => _SearchAndCategoryPageState();
}

class _SearchAndCategoryPageState extends State<SearchAndCategoryPage> {
  TextEditingController ksearch = TextEditingController();

  final _catList = ['All Catogery', 'Groceries', 'Fashion', 'Food', 'Others'];

  final _priceList = ['Any Price', '< 500', '< 750', '< 1000', '> 1000'];

  // final List<Product> products = [
  //   Product(
  //       title: "Product 1",
  //       imageUrl: "https://via.placeholder.com/150",
  //       rating: 4,
  //       price: 200),
    // Product(
    //     title: "Product 2",
    //     imageUrl: "https://via.placeholder.com/150",
    //     rating: 3,
    //     price: 150),
    // Product(
    //     title: "Product 3",
    //     imageUrl: "https://via.placeholder.com/150",
    //     rating: 5,
    //     price: 250),
    // Product(
    //     title: "Product 4",
    //     imageUrl: "https://via.placeholder.com/150",
    //     rating: 4,
    //     price: 220),
    // Product(
    //     title: "Product 5",
    //     imageUrl: "https://via.placeholder.com/150",
    //     rating: 2,
    //     price: 180),
  // ];

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
                  'Search Products Here',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Filters',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  margin: const EdgeInsets.only(left: 10),
                  child: DropdownButton<String>(
                    hint: const Text('Category'),
                    onChanged: (value) {},
                    items: _catList.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(fontSize: 15),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  margin: const EdgeInsets.only(left: 10),
                  child: DropdownButton<String>(
                    hint: const Text('Price'),
                    onChanged: (value) {},
                    items: _priceList.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(fontSize: 15),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ), 
          ),
          Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(10, (index) {
          return Column(
                      children: [
                        Container(
                          
                          margin: EdgeInsets.only(
                              right: 8, left: 8, top: 0, bottom: 0),
                          width: 135,
                          height: 135,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.blue.shade200,
                            image: const DecorationImage(
                              image:
                                  AssetImage("assets/images/decorators.jpeg"),
                                  fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("Hand Crafts"),
                        const SizedBox(
                            height: 8,
                          ),
                          const Text('Rs.90/-',style: TextStyle(fontSize: 11,fontWeight:FontWeight.bold,),),
                      ],
                    );
        }),
      ),
    ),
        ],
      );
  }
}

// class Product {
//   final String title;
//   final String imageUrl;
//   final double rating;
//   final double price;

//   Product({required this.title,required this.imageUrl,required this.rating,required this.price});
// }

