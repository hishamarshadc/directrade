import 'package:flutter/material.dart';
import 'package:sample_project/presentation/customer/screens/chat/chat_message_page.dart';

class ChatListPage extends StatelessWidget {
  ChatListPage({super.key});
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: ((ctx, index) {
    return ListTile(
      title: Text('Seller $index'),
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> ChatMessagePage(personName: 'Seller $index',)));
      },
      subtitle: const Text('Last Message Goes here'),
      leading: const CircleAvatar(
        radius: 25,
        backgroundColor: Colors.green,
        backgroundImage: AssetImage('assets/images/seller.jpg'),
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
