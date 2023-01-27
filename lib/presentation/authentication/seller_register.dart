import 'package:flutter/material.dart';

class SellerRegisterPage extends StatefulWidget {
  const SellerRegisterPage({super.key});

  @override
  State<SellerRegisterPage> createState() => _SellerRegisterPageState();

}

class _SellerRegisterPageState extends State<SellerRegisterPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(
      height: 30,
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
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          sizedBox,
                          const Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.black,
                              child: Icon(
                                Icons.person_add_alt_outlined,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ),
                          sizedBox,
                          const Text(
                            'Register as a Seller',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 30),
                          ),
                          sizedBox,
                          TextFormField(
                            validator: (value) {
                              if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                                //allow upper and lower case alphabets and space
                                return "Enter Correct Name";
                            }else{
                               return null;
                            }
                            },
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
                            validator: (value){
                            if(value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
                                return "Enter Correct Email Address";
                            }else{
                               return null;
                            }
                          },
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
                            validator: (value){
                            if(value!.isNotEmpty || !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$').hasMatch(value)){
                                //  r'^[0-9]{10}$' pattern plain match number with length 10
                                return "Enter Correct Phone Number";
                            }else{
                               return null;
                            }
                          },
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
                            controller: password,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock_rounded,
                                color: Colors.black,
                              ),
                              label: const Text('Enter Password'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          sizedBox,
                          TextFormField(
                            validator: (value) {
                              if(password.text!=cpassword.text||password.text.isEmpty)
                              {return "Password does not match";}
                              else{
                                return null;
                              }
                            },
                            controller: cpassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.lock_rounded,
                                color: Colors.black,
                              ),
                              label: const Text('Confirm Password'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          sizedBox,
                          TextFormField(
                            validator: (value){
                            if(value!.isEmpty || !RegExp(r'^[1-9][0-9]{5}$').hasMatch(value)){
                                //  r'^[0-9]{10}$' pattern plain match number with length 10
                                return "Enter a valid PIN code";
                            }else{
                               return null;
                            }
                          },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.numbers,
                                  color: Colors.black),
                              label: const Text('PIN Code'),
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
                                  const Icon(Icons.list_alt_rounded, color: Colors.black),
                              label: const Text('Company Address'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          sizedBox,
                          TextFormField(
                            validator: (value) {
                              if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                                //allow upper and lower case alphabets and space
                                return "Enter Correct Name";
                            }else{
                               return null;
                            }
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon:
                                  const Icon(Icons.store_mall_directory, color: Colors.black),
                              label: const Text('Company Name'),
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
                              onPressed: () {
                                if(formKey.currentState!.validate()){
                               //check if form data are valid, 
                               // your process task ahed if all data are valid
                               Navigator.popAndPushNamed(context, 'home');
                            }
                                
                                
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Already a User?'),
                              const SizedBox(
                                width: 1,
                              ),
                              TextButton(
                                onPressed: () => Navigator.popAndPushNamed(context, 'login'),
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
                                  Navigator.pop(context);
                                   
                                },
                                child: const Text(
                                  'Customer Register',
                                  style: TextStyle(
                                      color: Colors.redAccent, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          )
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
