import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustProfilePage extends StatelessWidget {
   CustProfilePage({super.key});

int _val=1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: const Text(
              'User Profile',
              style: TextStyle(
                fontSize: 27,
              ),

            ),
        ),
        body:Column(
          children: [
            Row(
                            children: [
                              Radio(
                                  value: 1,
                                  groupValue: _val,
                                  onChanged: (value) {

                                  }),
                              Radio(
                                  value: 2,
                                  groupValue: _val,
                                  onChanged: (value) {})
                            ],
                          ),
          ],
        )
      ),
    );
  }
}