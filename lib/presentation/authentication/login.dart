
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/presentation/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController kemail = TextEditingController();
  TextEditingController kpass = TextEditingController();
  final auth = FirebaseAuth.instance;
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
                        Center(
                          child: InkWell(
                            onLongPress: (){
                              Navigator.pushNamed(context, 'home');
                            },
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
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(Colors.transparent)
                            ),
                            onPressed: () async {
                              if(kemail.text.isEmpty||kpass.text.isEmpty){
                                ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: customsnackbar(errortext: 'Please enter your email/password',),
                                        elevation: 0,
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                      ),
                                    );

                              }
                              else{
                                if (kemail.text == users[0]['email'] ||
                                  kemail.text == users[1]['email'] ||
                                  kemail.text == users[2]['email'] ||
                                  kemail.text == users[3]['email']) {
                                for (int i = 0; i < users.length; i++) {
                                  if (kemail.text == users[i]['email'] &&
                                      kpass.text == users[i]['password']) {
                                    if (users[i]['type'] == 's') {
                                      Navigator.pushNamed(
                                          context, 'sellerhome');
                                    } else if (users[i]['type'] == 'p') {
                                      // Navigator.pushNamed(
                                      //     context, 'promptpending');
                                      ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: yellowSnackBar(errortext: 'You are waiting to be approved',),
                                        elevation: 0,
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                      ),
                                    );
                                    } else if (users[i]['type'] == 'c') {
                                      Navigator.pushNamed(context, 'home');
                                    } else if (users[i]['type'] == 'a') {
                                      Navigator.pushNamed(context, 'adminhome');
                                    }
                                  }
                                }
                              } else {
                                SharedPreferences pref =
                                    await SharedPreferences.getInstance();
                                if (kemail.text.isNotEmpty &&
                                    kpass.text.isNotEmpty) {
                                  try {
                                    await auth.signInWithEmailAndPassword(
                                        email: kemail.text,
                                        password: kpass.text);
                                    final user =
                                        FirebaseAuth.instance.currentUser;
                                    if (user != null) {
                                      pref.setString('email', kemail.text);
                                      Navigator.popAndPushNamed(
                                          context, 'home');
                                    }
                                  } catch (e) {
                                    print(e.toString());
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: customsnackbar(errortext: 'Wrong Email/Password',),
                                        elevation: 0,
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                      ),
                                    );
                                  }
                                }
                              }
                              }
                            },
                            child: const Text(
                              'Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
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

class customsnackbar extends StatelessWidget {
  const customsnackbar({
    Key? key, required this.errortext,
  }) : super(key: key);

  final String errortext;
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 90,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.all(
                      Radius.circular(15)),
              color: Colors.red.shade500),
          child: Row(
            children: [
              const SizedBox(
                width: 48,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children:  [
                     Text('Warning!'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.bold,
                          color:
                              Colors.white,
                        )),
                        const Spacer(),
                    Text(
                      errortext,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow
                          .ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
         Positioned(
            top: -20,
            left: -20,
            child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(
                  bottomLeft:
                      Radius.circular(20),
                ),
                child: IconButton(splashColor: Colors.transparent,onPressed:() {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  
                }, icon: Stack(alignment:Alignment.center,
                  children: [CircleAvatar(
                    backgroundColor: Colors.cyan.shade900,radius: 40,
                  ),
                    Icon(
                      Icons.cancel,color: Colors.black,
                      size: 30,),
                  ],
                )))),
      ],
    );
  }
}



class yellowSnackBar extends StatelessWidget {
  const yellowSnackBar({
    Key? key, required this.errortext,
  }) : super(key: key);

  final String errortext;
  

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 90,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.all(
                      Radius.circular(15)),
              color: Colors.amber.shade300),
          child: Row(
            children: [
              const SizedBox(
                width: 48,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children:  [
                     Text('Please Wait!'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.bold,
                          color:
                              Colors.white,
                        )),
                        const Spacer(),
                    Text(
                      errortext,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow
                          .ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
         Positioned(
            top: -20,
            left: -20,
            child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(
                  bottomLeft:
                      Radius.circular(20),
                ),
                child: IconButton(splashColor: Colors.transparent,onPressed:() {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                }, icon: Stack(alignment:Alignment.center,
                  children: [CircleAvatar(
                    backgroundColor: Colors.amber.shade700,radius: 40,
                  ),
                    Icon(
                      Icons.cancel,color: Colors.black,
                      size: 30,),
                  ],
                )))),
      ],
    );
  }
}





