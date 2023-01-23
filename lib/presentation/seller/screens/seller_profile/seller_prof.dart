import 'package:flutter/material.dart';

class SellerProfilePage extends StatelessWidget {
  const SellerProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.cyan.shade900,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
                        leading: const Icon(
                          Icons.phone,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'Phone Number',
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 20,
                              color: Colors.teal.shade900),
                        ),
                      ),
                    ),
                    onTap: () {
                      ('');
                    }),
                InkWell(
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: const Icon(
                        Icons.email,
                        color: Colors.teal,
                      ),
                      title: Text(
                        'Email@email.com',
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 20,
                            color: Colors.teal.shade900),
                      ),
                    ),
                  ),
                  onTap: () {
                    ('');
                  },
                ),
                InkWell(
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: const Icon(
                          Icons.location_on_sharp,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'Place',
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 20,
                              color: Colors.teal.shade900),
                        ),
                      ),
                    ),
                    onTap: () {
                      ('');
                    }),
                InkWell(
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: const Icon(
                          Icons.location_city,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'District',
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 20,
                              color: Colors.teal.shade900),
                        ),
                      ),
                    ),
                    onTap: () {
                      ('');
                    }),
                InkWell(
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: const Icon(
                          Icons.numbers,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'Pin Code',
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 20,
                              color: Colors.teal.shade900),
                        ),
                      ),
                    ),
                    onTap: () {
                      ('');
                    }),
                InkWell(
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: const Icon(
                          Icons.home_filled,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'Address',
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 20,
                              color: Colors.teal.shade900),
                        ),
                      ),
                    ),
                    onTap: () {
                      ('');
                    }),
                
                InkWell(
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: const Icon(
                          Icons.list_alt_rounded,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'Personal Address',
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 20,
                              color: Colors.teal.shade900),
                        ),
                      ),
                    ),
                    onTap: () {
                      ('');
                    }),
                InkWell(
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: const Icon(
                          Icons.store_mall_directory,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'Company Name',
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 20,
                              color: Colors.teal.shade900),
                        ),
                      ),
                    ),
                    onTap: () {
                      ('');
                    }),
                InkWell(
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: const Icon(
                          Icons.list_alt_rounded,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'Company Address',
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 20,
                              color: Colors.teal.shade900),
                        ),
                      ),
                    ),
                    onTap: () {
                      ('');
                    }),
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
                      Navigator.pushNamed(context, 'editseller');
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
