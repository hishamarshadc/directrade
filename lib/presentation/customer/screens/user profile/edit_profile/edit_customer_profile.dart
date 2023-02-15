import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustEdit extends StatefulWidget {
  @override
  State<CustEdit> createState() => _CustEditState();
}

class _CustEditState extends State<CustEdit> {
  TextEditingController kfname = TextEditingController();
  TextEditingController kemail = TextEditingController();
  TextEditingController kpassword = TextEditingController();
  TextEditingController kpin = TextEditingController();
  TextEditingController kaddress = TextEditingController();
  TextEditingController kphone = TextEditingController();
  final user=FirebaseAuth.instance.currentUser;
  final storeUser = FirebaseFirestore.instance;

  
  int a=2;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context, 'custprofile');
          },
        ),
      ),
      body:
      StreamBuilder<QuerySnapshot>(
              stream: storeUser
                  .collection("Users")
                  .where('email', isEqualTo: user?.email)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center();
                  default:
                    DocumentSnapshot document = snapshot.data!.docs[0];

                    return snapshot.data!.docs.isNotEmpty
                        ? 
                         Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color: Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/seller.jpg'))),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                                color: Colors.black,
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                buildTextField("Full Name", document['name'],2,kfname),
                buildTextField("E-mail", document['email'],1, kemail),
                buildTextField("Password", document['password'], 0,kpassword),
                buildTextField("PinCode", document['pincode'], 4,kpin),
                buildTextField("Phone No", document['phone'], 10, kphone),
                buildTextField("Address", document['address'], 5,kaddress),


                
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () {},
                      child: const Text("CANCEL",
                          style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 2.2,
                              color: Colors.black)),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () {
                        if(formKey.currentState!.validate())
                        {
                          Navigator.pushNamed(context, 'custprofile');
                          try{

                                   final user=FirebaseAuth.instance.currentUser;
                                   if(user!=null){

                                    storeUser.collection("Users").doc(user.uid).update({
                                      'email':kemail.text,
                                      'password':kpassword.text,
                                      'name':kfname.text,
                                      'address':kaddress.text,
                                      'pincode':kpin.text,
                                   });
                                    Navigator.popAndPushNamed(context, 'home');
                                   }
                                  
                                  }
                                  catch(e){
                                    print(e.toString());
                                  }
                        }
                      },
                      child: const Text(
                        " SAVE ",
                        style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),
        ),
      )
                        : const Text(
                            'empty',
                          );
                }
              },
            )
    );
  }

  Widget buildTextField(String labelText, String placeholder,int type,TextEditingController t) {
    // 0=password
    // 1=email
    // 2=name
    // 3=phone
    // 4=pin
  
    return Padding(

      padding: const EdgeInsets.only(bottom: 35.0),
      
      child: TextFormField(
        controller: t,
        
        validator: (value) {
          switch (type) {
            case 0:
              break;
            case 1:
              {
                if (value!.isEmpty ||
                    !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                  return "Enter Correct Email Address";
                } else {
                  return null;
                }
              }
              break;
            case 2:
              {
                if (value!.isEmpty ||
                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                  //allow upper and lower case alphabets and space
                  return "Enter Correct Name";
                } else {
                  return null;
                }
              }
              break;
            case 3:
              {
                if (value!.isNotEmpty ||
                    !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                        .hasMatch(value)) {
                  //  r'^[0-9]{10}$' pattern plain match number with length 10
                  return "Enter Correct Phone Number";
                } else {
                  return null;
                }
              }
              break;
            case 4:
              {
                if (value!.isEmpty ||
                    !RegExp(r'^[6][0-9]{5}$').hasMatch(value)) {
                  //  r'^[0-9]{10}$' pattern plain match number with length 10
                  return "Enter a valid PIN code";
                } else {
                  return null;
                }
              }
              break;

            default:
              return null;
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
          
      ),
    );
  }
}
