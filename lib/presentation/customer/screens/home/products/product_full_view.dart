import 'package:flutter/material.dart';

class ProductFullViewPage extends StatelessWidget {
  ProductFullViewPage({required this.title,required this.imageUrl});

  String title;
  String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(children: [
        AspectRatio(
          aspectRatio: 4 / 3,
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        )
      ]),
    );
  }
}
