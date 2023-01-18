import 'package:flutter/material.dart';

class CustLoginPage extends StatelessWidget {
  CustLoginPage({super.key});
  TextEditingController kemail = TextEditingController();
  TextEditingController kpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          const Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.login_rounded,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Login to DirecTrade',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 30),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: kemail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon:
                                  const Icon(Icons.email, color: Colors.black),
                              label: Text('Email'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: kpass,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon:const Icon(
                                Icons.lock_rounded,
                                color: Colors.black,
                              ),
                              label:const Text('Password'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.black),
                            width: double.infinity,
                            height: 60.0,
                            child: TextButton(
                              onPressed: () {
                                Navigator.popAndPushNamed(context, 'home');
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Not a User?'),
                              const SizedBox(
                                width: 1,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'reg');
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.indigo, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Go to'),
                              const SizedBox(
                                width: 1,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'admin');
                                },
                                child: const Text(
                                  'Admin Login',
                                  style: TextStyle(
                                      color: Colors.redAccent, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(onPressed:() {
                            Navigator.pushNamed(context, 'sellerhome');
                          }, child: Text('got to Seller'))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
