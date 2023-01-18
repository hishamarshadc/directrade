import 'package:flutter/material.dart';

class SellerCard extends StatelessWidget {
  int index;
   SellerCard({
    Key? key,required this.index
  }) : super(key: key);

//  List<String> sellerList=[
//       'Anshid O',
//       'Acee'

//  ]


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20)),
        child: ExpansionTile(
          leading: CircleAvatar(radius: 40, child: Icon(Icons.currency_rupee_outlined)),
          title: Text('sellername'),
          subtitle: Text('companyname'),
          children: [
            Column(
              children: [
                
                Text('Full Name : fullname${index+1}'),
                Text('Company Name : companyname${index+1}'),
                Text('Personal Address : paddress${index+1}'),
                Text('Company Address : Company address${index+1}'),
                Text('Place : place${index+1}'),
                Text('PIN Code : pi code${index+1}'),
                Text('District: district${index+1}'),
                Text('Email ID : eamil${index+1}'),
                Text('Phone No: phone${index+1}'),
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
