import 'package:flutter/material.dart';
import 'package:sample_project/presentation/user_model.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController kemail = TextEditingController();
  TextEditingController kpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                        const SizedBox(
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
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Login to DirecTrade',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 30),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: kemail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.email, color: Colors.black),
                            label: const Text('Email'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: kpass,
                          obscureText: true,
                          // validator: (value){
                          //   if(!kemail.text.contains('@'))
                          //   {
                          //     return 'Type a valid e-mail!';
                          //   }
                          // },
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
                        const SizedBox(
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
                              for(int i=0;i<users.length;i++){
                                if(kemail.text==users[i]['email']&&kpass.text==users[i]['password']){
                                  if(users[i]['type']=='s'){
                                    Navigator.pushNamed(context, 'sellerhome');
                                  }else if(users[i]['type']=='p'){
                                     Navigator.pushNamed(context, 'promptpending');
                                  }else if(users[i]['type']=='c'){
                                     Navigator.pushNamed(context, 'home');
                                  }
                                  else if(users[i]['type']=='a'){
                                     Navigator.pushNamed(context, 'adminhome');
                                  }
                                }
                              }
                              
                            },
                            child: const Text(
                              'Login',
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
                            const Text('Not a User?'),
                            const SizedBox(
                              width: 1,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'custreg');
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.indigo, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     const Text('Go to'),
                        //     const SizedBox(
                        //       width: 1,
                        //     ),
                        //     TextButton(
                        //       onPressed: () {
                        //         Navigator.pushNamed(context, 'admin');
                        //       },
                        //       child: const Text(
                        //         'Admin Login',
                        //         style: TextStyle(
                        //             color: Colors.redAccent, fontSize: 16),
                        //       ),
                        //     ),
                        //   ],
                        // ),
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
