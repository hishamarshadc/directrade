import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

final user = FirebaseAuth.instance.currentUser;
final db = FirebaseFirestore.instance;
final docRef = db.collection("Users").doc(user!.uid);
var data;

class SellerProfilePage extends StatelessWidget {
  const SellerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // docRef.get().then(
    //   (DocumentSnapshot doc) async {
    //     data = await doc.data() as Map<String, dynamic>;
    //   },
    //   onError: (e) => print("Error getting document: $e"),
    // );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: StreamBuilder<DocumentSnapshot>(
            stream: db.collection("Users").doc(user!.uid).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Spacer(flex: 1),
                  const CircleAvatar(
                      radius: 50,
                      child: Icon(
                        Icons.person_pin,
                        size: 60,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    snapshot.data!['name'].toUpperCase(),
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    snapshot.data!['email'],
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                    width: 150,
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(
                              color: Colors.black,
                            )),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Spacer(
                                flex: 3,
                              ),
                              Icon(
                                Icons.edit,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Edit Profile',
                                style: TextStyle(
                                    fontFamily: 'SourceSansPro',
                                    fontSize: 20,
                                    color: Colors.red),
                              ),
                              Spacer(flex: 3),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, 'editseller');
                      }),
                  const SizedBox(
                    height: 10.0,
                    width: 150,
                  ),
                  InkWell(
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(
                              color: Colors.black,
                            )),
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Spacer(
                                flex: 3,
                              ),
                              Icon(
                                Icons.phone,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Contact Us',
                                style: TextStyle(
                                  fontFamily: 'SourceSansPro',
                                  fontSize: 20,
                                ),
                              ),
                              Spacer(flex: 3),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, 'feedback');
                      }),
                  const SizedBox(
                    height: 10.0,
                    width: 150,
                  ),
                  // InkWell(
                  //     child: Card(
                  //       margin: const EdgeInsets.symmetric(
                  //           vertical: 10.0, horizontal: 25.0),
                  //       child: ListTile(
                  //         title: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: const [
                  //             Spacer(
                  //               flex: 3,
                  //             ),
                  //             Icon(
                  //               Icons.feedback_outlined,
                  //             ),
                  //             SizedBox(
                  //               width: 10,
                  //             ),
                  //             Text(
                  //               'FeedBack',
                  //               style: TextStyle(
                  //                 fontFamily: 'SourceSansPro',
                  //                 fontSize: 20,
                  //               ),
                  //             ),
                  //             Spacer(flex: 3),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     onTap: () {
                  //       Navigator.pushNamed(context, '');
                  //     }),
                  // SizedBox(
                  //   height: 10.0,
                  //   width: 150,
                  // ),
                  InkWell(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: const BorderSide(
                            color: Colors.black,
                          )),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Spacer(
                              flex: 3,
                            ),
                            Icon(
                              Icons.logout_outlined,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Logout',
                              style: TextStyle(
                                fontFamily: 'SourceSansPro',
                                fontSize: 20,
                              ),
                            ),
                            Spacer(flex: 3),
                          ],
                        ),
                      ),
                    ),
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();

                      final pref = await SharedPreferences.getInstance();
                      await pref.clear();
                      Navigator.pushAndRemoveUntil<void>(
                          context,
                          MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  ScreenSplash()),
                          ModalRoute.withName('/'));
                    },
                  ),
                  const Spacer(flex: 2),
                  const SizedBox(
                    height: 5,
                    width: 150,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'aboutus');
                    },
                    child: const Text('About Us'),
                    style: TextButton.styleFrom(foregroundColor: Colors.black),
                  ),
                  const SizedBox(
                    height: 20.0,
                    width: 150,
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Logined as a seller'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(
                    height: 20.0,
                    width: 150,
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}


// Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               const Spacer(flex: 1),
//               const CircleAvatar(
//                 radius: 50.0,
//                 backgroundImage: AssetImage('assets/images/seller.jpg'),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 '${data['name']}'.toUpperCase(),
//                 style: const TextStyle(
//                   fontSize: 30.0,
//                   fontFamily: 'Pacifico',
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(
//                 height: 20.0,
//                 width: 150,
//                 child: Divider(
//                   color: Colors.black,
//                 ),
//               ),
//               InkWell(
//                   child: Card(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         side: const BorderSide(
//                           color: Colors.black,
//                         )),
//                     margin: const EdgeInsets.symmetric(
//                         vertical: 10.0, horizontal: 25.0),
//                     child: ListTile(
//                       title: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Spacer(
//                             flex: 3,
//                           ),
//                           Icon(
//                             Icons.edit,
//                             color: Colors.red,
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             'Edit Profile',
//                             style: TextStyle(
//                                 fontFamily: 'SourceSansPro',
//                                 fontSize: 20,
//                                 color: Colors.red),
//                           ),
//                           Spacer(flex: 3),
//                         ],
//                       ),
//                     ),
//                   ),
//                   onTap: () {
//                     Navigator.pushNamed(context, 'editseller');
//                   }),
//               const SizedBox(
//                 height: 10.0,
//                 width: 150,
//               ),
//               InkWell(
//                   child: Card(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30),
//                         side: const BorderSide(
//                           color: Colors.black,
//                         )),
//                     margin: const EdgeInsets.symmetric(
//                         vertical: 10.0, horizontal: 25.0),
//                     child: ListTile(
//                       title: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Spacer(
//                             flex: 3,
//                           ),
//                           Icon(
//                             Icons.phone,
//                           ),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Text(
//                             'Contact Us',
//                             style: TextStyle(
//                               fontFamily: 'SourceSansPro',
//                               fontSize: 20,
//                             ),
//                           ),
//                           Spacer(flex: 3),
//                         ],
//                       ),
//                     ),
//                   ),
//                   onTap: () {
//                     Navigator.pushNamed(context, 'feedback');
//                   }),
//               const SizedBox(
//                 height: 10.0,
//                 width: 150,
//               ),
//               // InkWell(
//               //     child: Card(
//               //       margin: const EdgeInsets.symmetric(
//               //           vertical: 10.0, horizontal: 25.0),
//               //       child: ListTile(
//               //         title: Row(
//               //           mainAxisAlignment: MainAxisAlignment.center,
//               //           children: const [
//               //             Spacer(
//               //               flex: 3,
//               //             ),
//               //             Icon(
//               //               Icons.feedback_outlined,
//               //             ),
//               //             SizedBox(
//               //               width: 10,
//               //             ),
//               //             Text(
//               //               'FeedBack',
//               //               style: TextStyle(
//               //                 fontFamily: 'SourceSansPro',
//               //                 fontSize: 20,
//               //               ),
//               //             ),
//               //             Spacer(flex: 3),
//               //           ],
//               //         ),
//               //       ),
//               //     ),
//               //     onTap: () {
//               //       Navigator.pushNamed(context, '');
//               //     }),
//               // SizedBox(
//               //   height: 10.0,
//               //   width: 150,
//               // ),
//               InkWell(
//                 child: Card(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       side: const BorderSide(
//                         color: Colors.black,
//                       )),
//                   margin: const EdgeInsets.symmetric(
//                       vertical: 10.0, horizontal: 25.0),
//                   child: ListTile(
//                     title: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         Spacer(
//                           flex: 3,
//                         ),
//                         Icon(
//                           Icons.logout_outlined,
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           'Logout',
//                           style: TextStyle(
//                             fontFamily: 'SourceSansPro',
//                             fontSize: 20,
//                           ),
//                         ),
//                         Spacer(flex: 3),
//                       ],
//                     ),
//                   ),
//                 ),
//                 onTap: () async{
//                   final pref = await SharedPreferences.getInstance();
//                   await pref.clear();
//                   Navigator.pushAndRemoveUntil<void>(
//                       context,
//                       MaterialPageRoute<void>(
//                           builder: (BuildContext context) => LoginPage()),
//                       ModalRoute.withName('/'));
//                 },
//               ),
//               const Spacer(flex: 2),
//               const SizedBox(
//                 height: 5,
//                 width: 150,
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, 'aboutus');
//                 },
//                 child: const Text('About Us'),
//                 style: TextButton.styleFrom(foregroundColor: Colors.black),
//               ),
//               const SizedBox(
//                 height: 20.0,
//                 width: 150,
//                 child: Divider(
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 'Logined as a seller'.toUpperCase(),
//                 style: const TextStyle(
//                   fontSize: 20.0,
//                   fontFamily: 'Pacifico',
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),

//               const SizedBox(
//                 height: 20.0,
//                 width: 150,
//                 child: Divider(
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),