import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/core/fetchData.dart';
import 'package:sample_project/presentation/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final formKey = GlobalKey<FormState>();
  TextEditingController kemail = TextEditingController();
  TextEditingController kpass = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const sizedBox = SizedBox(
      height: 20,
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
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(children: [
                          SizedBox(
                            height: size.width * .2,
                          ),
                          Center(
                            child: InkWell(
                              onLongPress: () {
                                Navigator.pushNamed(context, 'test');
                              },
                              onDoubleTap: () {
                                Navigator.pushNamed(context, 'adminhome');
                              },
                              onTap: () {
                                Navigator.pushNamed(context, 'sellerhome');
                              },
                              child: const CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.lightBlue,
                                child: Icon(
                                  Icons.login_rounded,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                        ]),
                        sizedBox,
                        const Text(
                          'Login to DirecTrade',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 25),
                        ),
                        sizedBox,
                        Form(
                          key: formKey,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                      .hasMatch(value)) {
                                return "Enter a valid Email Address";
                              } else {
                                return null;
                              }
                            },
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
                        ),
                        sizedBox,
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
                        sizedBox,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.lightBlue),
                          width: double.infinity,
                          height: 60.0,
                          child: TextButton(
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent)),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                if (kemail.text.isEmpty || kpass.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: customsnackbar(
                                        errortext:
                                            'Please enter your email/password',
                                      ),
                                      elevation: 0,
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                    ),
                                  );
                                } else {
                                  SharedPreferences pref =
                                      await SharedPreferences.getInstance();
                                  if (kemail.text.isNotEmpty &&
                                      kpass.text.isNotEmpty) {
                                    try {
                                      await auth.signInWithEmailAndPassword(
                                          email: kemail.text,
                                          password: kpass.text);
                                      final newUser =
                                          FirebaseAuth.instance.currentUser;
                                      if (newUser != null) {
                                        String userType =
                                            await getCurrentUserData(
                                                newUser, 'userType');
                                        pref.setString('email', kemail.text);
                                        if (userType == 'c') {
                                          Navigator.popAndPushNamed(
                                              context, 'home');
                                        } else if (userType == 's') {
                                          Navigator.popAndPushNamed(
                                              context, 'sellerhome');
                                        } else if (userType == 'a') {
                                          Navigator.popAndPushNamed(
                                              context, 'adminhome');
                                        } else if (userType == 'p') {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: yellowSnackBar(
                                                errortext:
                                                    'Application not Approved !',
                                              ),
                                              elevation: 0,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              backgroundColor:
                                                  Colors.transparent,
                                            ),
                                          );
                                        }
                                      }
                                    } catch (e) {
                                      print(e.toString());
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: customsnackbar(
                                            errortext: 'Wrong Email/Password',
                                          ),
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
    Key? key,
    required this.errortext,
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
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: Colors.red.shade500),
          child: Row(
            children: [
              const SizedBox(
                width: 48,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Warning!'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    const Spacer(),
                    Text(
                      errortext,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
                child: IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    },
                    icon: Stack(
                      alignment: Alignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 30,
                        ),
                        Icon(
                          Icons.cancel,
                          color: Colors.red.shade500,
                          size: 30,
                        ),
                      ],
                    )))),
      ],
    );
  }
}

class yellowSnackBar extends StatelessWidget {
  const yellowSnackBar({
    Key? key,
    required this.errortext,
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
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color: Colors.amber.shade700),
          child: Row(
            children: [
              const SizedBox(
                width: 48,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Please Wait!'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    const Spacer(),
                    Text(
                      errortext,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
                child: IconButton(
                    splashColor: Colors.transparent,
                    onPressed: () {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    },
                    icon: Stack(
                      alignment: Alignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 40,
                        ),
                        Icon(
                          Icons.cancel,
                          color: Colors.amber.shade700,
                          size: 30,
                        ),
                      ],
                    )))),
      ],
    );
  }
}
