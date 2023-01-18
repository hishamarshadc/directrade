import 'package:flutter/material.dart';

class WaitingCard extends StatelessWidget {
  const WaitingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20)),
        child: ExpansionTile(
          leading: CircleAvatar(radius: 40, child: Icon(Icons.person)),
          title: Text('sellername'),
          subtitle: Text('companyname'),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all(Colors.green),
                  ),
                    onPressed: () => {},
                    icon: Icon(Icons.done),
                    label: Text('Approve')),
                    SizedBox(width: 10),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all(Colors.red),
                  ),
                    onPressed: () => {},
                    icon: Icon(Icons.close),
                    label: Text('Cancel')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
