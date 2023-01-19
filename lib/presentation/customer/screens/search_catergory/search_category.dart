import 'package:flutter/material.dart';
import 'package:sample_project/presentation/customer/screens/search_catergory/widgets/product_tile.dart';

class SearchAndCategoryPage extends StatefulWidget {
  const SearchAndCategoryPage({super.key});

  @override
  State<SearchAndCategoryPage> createState() => _SearchAndCategoryPageState();
}

class _SearchAndCategoryPageState extends State<SearchAndCategoryPage> {
  TextEditingController ksearch = TextEditingController();

  final _catList = ['All Catogery', 'Groceries', 'Fashion', 'Food', 'Others'];

  final _priceList = ['Any Price', '< 500', '< 750', '< 1000', '> 1000'];


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
              return ProductTile();
            })
          ),
        ),
      ],
    );
  }
}
