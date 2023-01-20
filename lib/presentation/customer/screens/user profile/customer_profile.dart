import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample_project/core/constants.dart';

class CustProfilePage extends StatelessWidget {
  CustProfilePage({super.key});

  int _val = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: const Text(
              'User Profile',
              style: TextStyle(
                fontSize: 27,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Center(
                            child: SizedBox(
                              width: 120,
                              height: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image(
                                  image: AssetImage('assets/images/seller.jpg'),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 80,
                            bottom: 0,
                            left: 90,
                            right: 0,
                            child: IconButton(
                              splashRadius: 10,
                              onPressed: () {},
                              icon: Icon(
                                CupertinoIcons.pencil_circle_fill,
                                size: 40,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text('Hisham Arshad'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('Edit Profile')),
                      ),
                      const Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
              SizedBox(height: 30,),
              Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * .5-90),
                            child: ListTile(
                              tileColor: Colors.red,
                              onTap: () {
                                
                              },
                              leading: Icon(Icons.logout_rounded),
                              title: Text(
                                'LogOut',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      ),
                  Column(
                    children: [
                      // ListTile(title: Text('hello'),)
                     TextFormField(//textInputAction:TextInputAction.
                     )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}


// Column(
//             children: [
//               Row(
//                 children: [
//                   Radio(value: 1, groupValue: _val, onChanged: (value) {}),
//                   Radio(value: 2, groupValue: _val, onChanged: (value) {})
//                 ],
//               ),
//             ],
//           )