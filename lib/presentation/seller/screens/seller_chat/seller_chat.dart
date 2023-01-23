import 'package:flutter/material.dart';
import 'package:sample_project/presentation/customer/screens/chat/chat_message_page.dart';

class SellerChatPage extends StatelessWidget {
  const SellerChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: ((ctx, index) {
    return ListTile(
      title: Text('Customer $index'),
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ChatMessagePage(personName: 'Customer $index',)));
      },
      subtitle: const Text('Last Message Goes here'),
      leading: const CircleAvatar(
        radius: 25,
        backgroundColor: Colors.black,
        // backgroundImage: AssetImage('assets/images/seller.jpg'),
        child: Icon(Icons.person),
      ),
      trailing: Text('1$index:00 PM'),
    );
      }
      ),
      separatorBuilder: ((context, index) {
    return const Divider();
      }
      ),
      itemCount: 30,
    );
  }
}
