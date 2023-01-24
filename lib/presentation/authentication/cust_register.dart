import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustRegisterPage extends StatelessWidget {
  CustRegisterPage({super.key});
  final kemail=TextEditingController();
  final kpass=TextEditingController();
  final auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    
    const sizedBox = SizedBox(
      height: 15,
    );
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        sizedBox,
                        const Center(
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.black,
                            child: Icon(
                              Icons.person_add_alt_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        sizedBox,
                        const Text(
                          'Register as a Customer',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 30),
                        ),
                        sizedBox,
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.person, color: Colors.black),
                            label: const Text('Full Name'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        sizedBox,
                        TextFormField(
                          controller: kemail,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.email, color: Colors.black),
                            label: const Text('Email'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        sizedBox,
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.phone,
                                color: Colors.black),
                            label: const Text('Phone Number'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        sizedBox,
                        TextFormField(
                          controller: kpass,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock_rounded,
                              color: Colors.black,
                            ),
                            label: const Text('Password'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        sizedBox,
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.home_filled, color: Colors.black),
                            label: const Text('Full Address'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        sizedBox,
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.location_on_sharp,
                                color: Colors.black),
                            label: const Text('PIN Code'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        sizedBox,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.black),
                          width: double.infinity,
                          height: 60.0,
                          child: TextButton(
                            onPressed: () async {
                              SharedPreferences pref=await SharedPreferences.getInstance();
                              if(kemail.text.isNotEmpty&&kpass.text.isNotEmpty)
                              {
                                try{
                                 await auth.createUserWithEmailAndPassword(email: kemail.text, password: kpass.text);
                                 final user=FirebaseAuth.instance.currentUser;
                                 if(user!=null){
                                  pref.setString('email', kemail.text);
                                  Navigator.popAndPushNamed(context, 'home');
                                 }
                                
                                }
                                catch(e){
                                  print(e.toString());
                                }
                              }
                              
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        // sizedBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already a User?'),
                            const SizedBox(
                              width: 1,
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'User Login',
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
                                Navigator.pushNamed(context, 'sellreg');
                              },
                              child: const Text(
                                'Seller Register',
                                style: TextStyle(
                                    color: Colors.redAccent, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        sizedBox
                      ],
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
