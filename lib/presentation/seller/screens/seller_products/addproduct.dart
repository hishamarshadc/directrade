import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample_project/presentation/seller/screens/seller_products/seller_product.dart';

class AddProductForm extends StatefulWidget {
  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isRetail = true;
  late String _productName;
  late int _maxQuantity;
  late int _minQuantity;
  late int price;
  final _imageController = TextEditingController();

  File? image;
  Future pickimagefromgallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imgtemp = File(image.path);
      setState(() {
        this.image = imgtemp;
      });
    } on PlatformException catch (e) {
      return ('failed to pick image: $e ');
    }
  }

  Future pickusingcamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imgtemp = File(image.path);
      setState(() {
        this.image = imgtemp;
      });
    } on PlatformException catch (e) {
      return ('failed to pick image: $e ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              child: image != null
                  ? Image.file(
                      image!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    )
                  : FlutterLogo(
                      size: 160,
                    ),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
                width: 10,
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {
                      pickusingcamera();
                    },
                    icon: Icon(Icons.camera_alt_rounded),
                    label: Text('Capture Image')),
                ElevatedButton.icon(
                    onPressed: () {
                      pickimagefromgallery();
                    },
                    icon: Icon(Icons.folder_copy_rounded),
                    label: Text('Pick Image from gallery')),
              ],
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Product Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a name for the product';
                }
                return null;
              },
              onSaved: (value) => _productName = value!,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Price'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the price';
                }
                return null;
              },
              onSaved: (value) => _maxQuantity = int.parse(value!),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Max Quantity'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the maximum quantity';
                }
                return null;
              },
              onSaved: (value) => _maxQuantity = int.parse(value!),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Min Quantity'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the minimum quantity';
                }
                return null;
              },
              onSaved: (value) => _minQuantity = int.parse(value!),
            ),
            SwitchListTile(
              title: const Text('Retail'),
              value: _isRetail,
              onChanged: (value) {
                setState(() {
                  _isRetail = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Wholesale'),
              value: !_isRetail,
              onChanged: (value) {
                setState(() {
                  _isRetail = !value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.pop(context);

                  // Add logic to save the product here
                  // ...
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
