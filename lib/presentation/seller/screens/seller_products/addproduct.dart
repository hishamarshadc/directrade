import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _imageController,
              decoration: InputDecoration(labelText: 'Image URL'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a URL for the product image';
                }
                return null;
              },
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
