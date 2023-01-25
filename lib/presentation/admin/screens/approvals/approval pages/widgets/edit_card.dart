import 'package:flutter/material.dart';

class SellerEditCard extends StatelessWidget {
  const SellerEditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20)),
        child: ExpansionTile(
          leading: const CircleAvatar(radius: 40, child: Icon(Icons.person)),
          title: const Text('sellername'),
          subtitle: const Text('companyname'),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all(Colors.green),
                  ),
                    onPressed: () => {},
                    icon: const Icon(Icons.done),
                    label: const Text('Approve')),
                    const SizedBox(width: 10),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all(Colors.red),
                  ),
                    onPressed: () => {},
                    icon: const Icon(Icons.close),
                    label: const Text('Cancel')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}