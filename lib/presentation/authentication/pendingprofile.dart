import 'package:flutter/material.dart';

class InactivePage extends StatelessWidget {
  const InactivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Your Account is Temperorily Suspended'),
      ),
    );
  }
}