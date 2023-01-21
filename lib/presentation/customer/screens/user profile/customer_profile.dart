import 'package:flutter/material.dart';
import 'package:sample_project/presentation/authentication/login.dart';

class CustProfilePage extends StatelessWidget {
  const CustProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.cyan.shade900,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(flex: 2,),
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/seller.jpg'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Full Name'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              InkWell(
                  child: Card(
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
                    Navigator.pushNamed(context, 'editcust');
                  }),
              const SizedBox(
                height: 10.0,
                width: 150,
              ),
              InkWell(
                  child: Card(
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
                    Navigator.pushNamed(context, '');
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
                onTap: () {
                  Navigator.pushAndRemoveUntil<void>(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => LoginPage()),
                      ModalRoute.withName('/'));
                },
              ),
              Spacer(flex: 1,)
            ],
          ),
        ),
      ),
    );
  }
}
