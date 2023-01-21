// import 'package:flutter/material.dart';

// class EditSeller extends StatelessWidget {
//   const EditSeller({super.key});
//   @override
//   Widget build(BuildContext context) {
//     const sizedBox = SizedBox(
//       height: 30,
//     );
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: SizedBox(
//               width: double.infinity,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 20),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         sizedBox,
//                         const Text(
//                           'Edit Profile',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               color: Colors.black,
//                               fontSize: 30),
//                         ),
//                         sizedBox,
//                         Center(
//                           child: Column(
//                             children: [
//                               CircleAvatar(
//                                 radius: 50.0,
//                                 backgroundImage:
//                                     AssetImage('assets/images/seller.jpg'),
//                               ),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               IconButton(
//                                   onPressed: () {},
//                                   icon: Container(height: 35,width: 35,decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(50),
//                                     color: Colors.black,
//                                   ),child: const Icon(color: Colors.white,Icons.edit)),)
//                             ],
//                           ),
//                         ),
//                         sizedBox,
//                         sizedBox,
//                         TextFormField(
//                           keyboardType: TextInputType.emailAddress,
//                           decoration: InputDecoration(
//                             prefixIcon:
//                                 const Icon(Icons.person, color: Colors.black),
//                             label: const Text('Full Name'),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(100),
//                             ),
//                           ),
//                         ),
//                         sizedBox,
//                         TextFormField(
//                           keyboardType: TextInputType.name,
//                           decoration: InputDecoration(
//                             prefixIcon:
//                                 const Icon(Icons.email, color: Colors.black),
//                             label: const Text('Email'),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(100),
//                             ),
//                           ),
//                         ),
//                         sizedBox,
//                         TextFormField(
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                             prefixIcon:
//                                 const Icon(Icons.phone, color: Colors.black),
//                             label: const Text('Phone Number'),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(100),
//                             ),
//                           ),
//                         ),
//                         sizedBox,
//                         TextFormField(
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             prefixIcon: const Icon(
//                               Icons.lock_rounded,
//                               color: Colors.black,
//                             ),
//                             label: const Text('Create Password'),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(100),
//                             ),
//                           ),
//                         ),
//                         sizedBox,
//                         TextFormField(
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             prefixIcon: const Icon(
//                               Icons.lock_rounded,
//                               color: Colors.black,
//                             ),
//                             label: const Text('Confirm Password'),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(100),
//                             ),
//                           ),
//                         ),
//                         sizedBox,
//                         TextFormField(
//                           keyboardType: TextInputType.emailAddress,
//                           decoration: InputDecoration(
//                             prefixIcon: const Icon(Icons.location_on_sharp,
//                                 color: Colors.black),
//                             label: const Text('Place'),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(100),
//                             ),
//                           ),
//                         ),
//                         sizedBox,
//                         TextFormField(
//                           keyboardType: TextInputType.emailAddress,
//                           decoration: InputDecoration(
//                             prefixIcon: const Icon(Icons.location_city,
//                                 color: Colors.black),
//                             label: const Text('District'),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(100),
//                             ),
//                           ),
//                         ),
//                         sizedBox,
//                         TextFormField(
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                             prefixIcon:
//                                 const Icon(Icons.numbers, color: Colors.black),
//                             label: const Text('PIN Code'),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(100),
//                             ),
//                           ),
//                         ),
//                         sizedBox,
//                         TextFormField(
//                           keyboardType: TextInputType.emailAddress,
//                           decoration: InputDecoration(
//                             prefixIcon: const Icon(Icons.home_filled,
//                                 color: Colors.black),
//                             label: const Text('Address'),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(100),
//                             ),
//                           ),
//                         ),
//                         sizedBox,
//                         TextFormField(
//                           keyboardType: TextInputType.emailAddress,
//                           decoration: InputDecoration(
//                             prefixIcon: const Icon(Icons.list_alt_rounded,
//                                 color: Colors.black),
//                             label: const Text('Personal Address'),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(100),
//                             ),
//                           ),
//                         ),
//                         sizedBox,
//                         TextFormField(
//                           keyboardType: TextInputType.emailAddress,
//                           decoration: InputDecoration(
//                             prefixIcon: const Icon(Icons.store_mall_directory,
//                                 color: Colors.black),
//                             label: const Text('Company Name'),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(100),
//                             ),
//                           ),
//                         ),
//                         sizedBox,
//                         TextFormField(
//                           keyboardType: TextInputType.emailAddress,
//                           decoration: InputDecoration(
//                             prefixIcon: const Icon(Icons.list_alt_rounded,
//                                 color: Colors.black),
//                             label: const Text('Company Address'),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(100),
//                             ),
//                           ),
//                         ),
//                         sizedBox,
//                         Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(100),
//                               color: Colors.black),
//                           width: double.infinity,
//                           height: 60.0,
//                           child: TextButton(
//                             onPressed: () {
//                               Navigator.pop(context, 'sellerprofile');
//                             },
//                             child: const Text(
//                               'Save',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 20),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 40,
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class EditSeller extends StatefulWidget {
  const EditSeller({super.key});

  @override
  State<EditSeller> createState() => _EditSellerState();
}

class _EditSellerState extends State<EditSeller> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
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
            Navigator.pushNamed(context,'sellerprofile');
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
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
              buildTextField("Full Name", "Full name", false),
              buildTextField("E-mail", "Email@email.com", false),
              buildTextField("Password", "", true),
              buildTextField("Place", "Place", false),
              buildTextField("District", "District", false),
              buildTextField("PinCode", "PinCode", false),
              buildTextField("Personal Address", "Address", false),
              buildTextField("Company Name", "Company Name", false),
              buildTextField("Company Address", "Company address", false),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(style: OutlinedButton.styleFrom(
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
                  ElevatedButton(style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                    onPressed: () {},
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
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    bool showPassword = isPasswordTextField;
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField = true ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
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
