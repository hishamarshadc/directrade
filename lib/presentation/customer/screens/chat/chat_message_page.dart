import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class ChatMessagePage extends StatefulWidget {
  const ChatMessagePage({super.key, required this.personName});
  final String personName;

  @override
  State<ChatMessagePage> createState() => _ChatMessagePageState();
}

class _ChatMessagePageState extends State<ChatMessagePage> {
 

  List<Message> messages = [
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(const Duration(days: 3, minutes: 3)),
      isSentByMe: false,
    ),

    Message(
      text: 'Do You Provide Free Delivery?',
      date: DateTime.now().subtract(const Duration(days: 3, minutes: 2)),
      isSentByMe: true,
    ),
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(const Duration(days: 4, minutes: 3)),
      isSentByMe: false,
    ),
    Message(
      text: 'Do You Provide Free Delivery?',
      date: DateTime.now().subtract(const Duration(days: 4, minutes: 4)),
      isSentByMe: true,
    ),
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(const Duration(days: 5, minutes: 3)),
      isSentByMe: false,
    ),
    Message(
      text: 'Do You Provide Free Delivery?',
      date: DateTime.now().subtract(const Duration(days: 5, minutes: 4)),
      isSentByMe: true,
    ),
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(const Duration(days: 10, minutes: 3)),
      isSentByMe: false,
    ),
    Message(
      text: 'Do You Provide Free Delivery?',
      date: DateTime.now().subtract(const Duration(days: 10, minutes: 4)),
      isSentByMe: true,
    ),
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(const Duration(days: 11, minutes: 3)),
      isSentByMe: false,
    ),
    Message(
      text: 'Do You Provide Free Delivery?',
      date: DateTime.now().subtract(const Duration(days: 11, minutes: 4)),
      isSentByMe: true,
    ),
    Message(
      text: 'Yes sure!',
      date: DateTime.now().subtract(const Duration(days: 12, minutes: 3)),
      isSentByMe: false,
    ),
    Message(
      text: 'Do You Provide Free Delivery?',
      date: DateTime.now().subtract(const Duration(days: 12, minutes: 4)),
      isSentByMe: true,
    ),
    // Message(),
  ].reversed.toList();

  // _ChatMessagePageState(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Text(widget.personName,
            style: const TextStyle(
              fontSize: 27,
            ),
          ),
          actions: [
            IconButton(
              iconSize: 35,
              onPressed: () {
                Navigator.pushNamed(context, 'chatsellerdetails');
              },
              icon: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/seller.jpg'),
              ),
            ),
          ]),
      // appBar: AppBar(
      //    const CircleAvatar(
      //     backgroundImage: AssetImage('assets/images/seller.jpg'),
      //   ),
      //   title:const Text('Seller Name'),
      // ),
      body: Column(
        children: [
          Expanded(
            child: GroupedListView<Message, DateTime>(
                reverse: true,
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                floatingHeader: true,
                padding: const EdgeInsets.all(8),
                elements: messages,
                groupBy: (message) => DateTime(
                      message.date.year,
                      message.date.month,
                      message.date.day,
                    ),
                groupHeaderBuilder: (Message message) => SizedBox(
                      height: 40,
                      child: Center(
                          child: Card(
                        color: Theme.of(context).primaryColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            DateFormat.yMMMd().format(message.date),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      )),
                    ),
                itemBuilder: (context, Message message) => Align(
                      alignment: message.isSentByMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Card(
                        elevation: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(message.text),
                        ),
                      ),
                    )),
          ),
          Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                child: TextField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    hintText: 'Type Message Here..',
                  ),
                  onSubmitted: (text) {
                    final message = Message(
                      text: text,
                      date: DateTime.now(),
                      isSentByMe: true,
                    );
                    setState(() => messages.add(message));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  const Message({
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}
