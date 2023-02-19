
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset('assets/icon/DT Slogan.jpeg'),
          CircularProgressIndicator(color: Colors.lightBlue,)
        ],
      ),
    );
  }
}