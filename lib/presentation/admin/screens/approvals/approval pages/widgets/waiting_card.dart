import 'package:flutter/material.dart';
import 'package:sample_project/core/colors/Colors.dart';

class WaitingCard extends StatelessWidget {
  const WaitingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20)),
        child: ExpansionTile(
          tilePadding: EdgeInsets.all(8),
          childrenPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
          leading: const CircleAvatar(radius: 40, child: Icon(Icons.person)),
          title: const Text('Seller Name : \nHisham Arshad C',style:textStyleHead,),
          subtitle: const Text('Business Name : Awesome Designers',style: textStyleSubhead,),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Business Address : \n\tMamatha Bakery,Areacode Bypass,Near Driving School',style: subTextStyle,),
            Text('PIN Code : 673019',style: subTextStyle,),
            Text('Phone : 9207631618',style: subTextStyle,),
            Text('Email ID : seller@gmail.com',style: subTextStyle,),
            SizedBox(height: size.width*.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all(Colors.green),
                  ),
                    onPressed: () => {},
                    icon: const Icon(Icons.done),
                    label: const Text('Approve')),
                    const SizedBox(width: 10),
                    Spacer(),
                ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all(Colors.red),
                  ),
                    onPressed: () => {},
                    icon: const Icon(Icons.close),
                    label: const Text('Reject')),
                    Spacer()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
