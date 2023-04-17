import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample_project/presentation/authentication/login.dart';
import 'package:sample_project/presentation/authentication/seller_verification.dart';

class SellerRegisterPage extends StatefulWidget {
  const SellerRegisterPage({super.key});

  @override
  State<SellerRegisterPage> createState() => _SellerRegisterPageState();
}

class _SellerRegisterPageState extends State<SellerRegisterPage> {
  final formKey = GlobalKey<FormState>();

  final kpass = TextEditingController();
  final cpass = TextEditingController();
  final kname = TextEditingController();
  final kcname = TextEditingController();
  final kemail = TextEditingController();
  final kphone = TextEditingController();
  final kaddress = TextEditingController();
  final kpincode = TextEditingController();

  final auth = FirebaseAuth.instance;

  final storeUser = FirebaseFirestore.instance;

  String? productImgUrl;
  File? image;
  late var imgTemp;
  UploadTask? uploadTask;

   Future pickusingcamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imgtemp = File(image.path);
      imgTemp = File(image.path);
      setState(() {
        this.image = imgtemp;
      });
    } on PlatformException catch (e) {
      return ('Failed to Pick Image: $e ');
    }
  }
  
  Future pickimagefromgallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imgtemp = File(image.path);
      imgTemp = File(image.path);
      setState(() {
        this.image = imgtemp;
      });
    } on PlatformException catch (e) {
      return ('failed to pick image: $e ');
    }
  }

  Future<String> uploadImage(File image) async {
    // Generate a unique file name
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    // Create a reference to the file location in Firebase Storage
    Reference ref = FirebaseStorage.instance.ref().child('images/proof images/$fileName');

    // Upload the file to Firebase Storage
    uploadTask = ref.putFile(image);

    final snapshot = await uploadTask!.whenComplete(() {});

    // Get the download URL for the file
    String downloadURL = await snapshot.ref.getDownloadURL();

    // Return the download URL
    return downloadURL;
  }




  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(
      height: 20,
    );
    var _selectedImage = true;

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
                              backgroundColor: Colors.lightBlue,
                              child: Icon(
                                Icons.person_add_alt_outlined,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                          sizedBox,
                          const Text(
                            'Register as a Seller',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 25),
                          ),
                          sizedBox,
                          TextFormField(
                            controller: kname,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                //allow upper and lower case alphabets and space
                                return "Enter Correct Name";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
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
                            controller: kcname,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                //allow upper and lower case alphabets and space
                                return "Enter Correct Name";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.store_mall_directory,
                                  color: Colors.black),
                              label: const Text('Company Name'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          sizedBox,
                          TextFormField(
                            controller: kemail,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                      .hasMatch(value)) {
                                return "Enter Correct Email Address";
                              } else {
                                return null;
                              }
                            },
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
                          sizedBox,
                          TextFormField(
                            controller: kphone,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                      .hasMatch(value)) {
                                //  r'^[0-9]{10}$' pattern plain match number with length 10
                                return "Enter Correct Phone Number";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon:
                                  const Icon(Icons.phone, color: Colors.black),
                              label: const Text('Phone Number'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          sizedBox,
                          TextFormField(
                            controller: kaddress,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.list_alt_rounded,
                                  color: Colors.black),
                              label: const Text('Company Address'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          sizedBox,
                          TextFormField(
                            controller: kpincode,
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[1-9][0-9]{5}$').hasMatch(value)) {
                                //  r'^[0-9]{10}$' pattern plain match number with length 10
                                return "Enter a valid PIN code";
                              } else {
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
                            controller: kpass,
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
                            controller: cpass,
                            validator: (value) {
                              if (kpass.text != cpass.text ||
                                  kpass.text.isEmpty) {
                                return "Password does not match";
                              } else {
                                return null;
                              }
                            },
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
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade500),
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Upload Seller Proof Image',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.grey.shade600),
                                      ),
                                      InkWell(
                                        // Select from Camera
                                        onTap: () {
                                               pickusingcamera();
                                        },
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          size: 30,
                                          color: Colors.lightBlue,
                                        ),
                                      ),
                                      InkWell(
                                        //Select from Gallery
                                        onTap: () {
                                          pickimagefromgallery();
                                        },
                                        child: Icon(
                                          Icons.image_search,
                                          size: 30,
                                          color: Colors.lightBlue,
                                        ),
                                      )
                                    ],
                                  ),
                                  Visibility(
                                    visible: _selectedImage,
                                    child: (image!=null)?Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 150,
                                              child: Text( image!.path.split('/').last,style: TextStyle(fontSize: 15),overflow: TextOverflow.ellipsis,),
                                            
                                            ),
                                             SizedBox(width: 10,),
                                            Container(
                                              width: 30,
                                              height: 30,
                                              child:Image.file(
                                                fit: BoxFit.fill,
                                                image!,                                        
                                                ),
                                            ),
                                            Icon(
                                              Icons.check_rounded,
                                              color: Colors.green,
                                              size: 30,
                                            )
                                          ],
                                        ):Container(),
                                  )
                                ],
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
                              onPressed: () async {


                                if (kemail.text.isNotEmpty &&
                                    kpass.text.isNotEmpty &&
                                    formKey.currentState!.validate()&&_selectedImage) {
                                  try {
                                    await auth.createUserWithEmailAndPassword(
                                        email: kemail.text,
                                        password: kpass.text);
                                    final user =
                                        FirebaseAuth.instance.currentUser;
                                    final proofimage= await  uploadImage(image!);

                                    if (user != null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SellerEmailVerificationScreen(
                                            name: kname.text,
                                            cname: kcname.text,
                                            proofimage: proofimage,
                                            email: kemail.text,
                                            password: kpass.text,
                                            phone: kphone.text,
                                            address: kaddress.text,
                                            pincode: kpincode.text,
                                          ),
                                        ),
                                      );
                                      
                                      // ScaffoldMessenger.of(context)
                                      //     .showSnackBar(
                                      //   const SnackBar(
                                      //     content: customsnackbar(
                                      //       errortext:
                                      //           'Application Submitted\n Try Login later',
                                      //       errorcolor: Colors.yellow,
                                      //     ),
                                      //     elevation: 0,
                                      //     behavior: SnackBarBehavior.floating,
                                      //     backgroundColor: Colors.transparent,
                                      //   ),
                                      // );
                                    }
                                  } on FirebaseAuthException catch (e){
                                    if(e.code=="email-already-in-use"){
                                        ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: customsnackbar(
                                            errortext:
                                                'Email is Already Used!\nTry another Email.',
                                            errorcolor: Colors.yellow,
                                          ),
                                          elevation: 0,
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                        ),
                                      );
                                    }
                                  }catch (e) {
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
                                onPressed: () =>
                                    Navigator.popAndPushNamed(context, 'login'),
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
                                  Navigator.popAndPushNamed(context, 'custreg');
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
