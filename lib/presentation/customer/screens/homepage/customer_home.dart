


import 'package:flutter/material.dart';
// import 'package:sample_project/presentation/customer/screens/search_catergory/widgets/product_full_view.dart';
import 'package:sample_project/presentation/customer/widgets/item.dart';

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
                  Text("Show more")
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      // onTap: () => Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => ProductFullViewPage(
                      //     title: 'Embroidary Threads',
                      //     imageUrl: 'assets/images/color threads.jpeg',
                      //   ),
                      //   ),
                      // ),
                      child: Column(
                        children: [
                          Hero(
                            tag: "$index",
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: 8, left: 8, top: 0, bottom: 0),
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14)),
                                color: Colors.black,
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/color threads.jpeg"),
                                     fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Embroidary"),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text('Rs.100 /-',style: TextStyle(fontSize: 11,fontWeight:FontWeight.bold,),),
                        ],
                      ),
                    );
                  }),
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
                  Text("Show more")
                ],
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    // onTap: () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => ProductFullViewPage(
                    //       title: 'Decorator Bags',
                    //       imageUrl: 'assets/images/decorators.jpeg',
                    //     ),
                    //     ),
                    //   ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              right: 8, left: 8, top: 0, bottom: 0),
                          width: 100,
                          height: 100,
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
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<Item> _choices = [
    Item("All", Icon(Icons.clear_all_rounded)),
    Item("Men", Icon(Icons.person)),
    Item("Women", Icon(Icons.emoji_people_sharp)),
    Item("Fashion", Icon(Icons.shopping_bag)),
    Item("Baby", Icon(Icons.child_care)),
    Item("Kids", Icon(Icons.face_sharp))
  ];
}
