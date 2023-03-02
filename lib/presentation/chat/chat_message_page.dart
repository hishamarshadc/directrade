import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class ChatMessagePage extends StatefulWidget {
  ChatMessagePage({super.key, required this.id,required this.passingdocument});
  DocumentSnapshot passingdocument;
  String id;
  // String name;
  // String image = '';
  

  @override
  State<ChatMessagePage> createState() => _ChatMessagePageState();
}

class _ChatMessagePageState extends State<ChatMessagePage> {
  TextEditingController msg = TextEditingController();

  final auth = FirebaseAuth.instance;
  final storeUser = FirebaseFirestore.instance;

  List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: Text(
              (widget.passingdocument['userType']=='s')?widget.passingdocument['companyname']:widget.passingdocument['name'],
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
                  child: Icon(Icons.person_pin),
                ),
              ),
            ]),
        body: 
Column(
          children: [
            Expanded(
              child: StreamBuilder(
          stream: storeUser
          .collection('Messages')
          .where('chatId',whereIn: ['${auth.currentUser!.uid}${widget.id}','${widget.id}${auth.currentUser!.uid}'])
          .orderBy('time')
          .snapshots(),
          builder: (context, snapshot) {
            if(snapshot.hasError){
              return Text('Error:${snapshot.error}');
            }
            if(snapshot.data==null){
              print("Snapshot null");
            }
  
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
                break;
              default:
                messages.clear();
                for(int i=0;i<snapshot.data!.docs.length;i++){
                  DocumentSnapshot document =snapshot.data!.docs[i];
                  final message = Message(
                    text: document['messageText'],
                    date: (document['time'] as Timestamp).toDate(),
                    isSentByMe: document['fromId'] == auth.currentUser!.uid
                        ? true
                        : false);

                messages.add(message);
                }
                
                return snapshot.data!.docs.isNotEmpty
                ? GroupedListView(
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
                        child: Container(
                          width: message.text.length > 50 ? size.width * 0.8 : null,
                          child: Card(
                            elevation: 8,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(message.text),
                                  SizedBox(height: 3,),
                                  Text(DateFormat.jm().format(message.date),style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10),
                                              textAlign: TextAlign.end,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                  ):
        Center(child: Text('No Messages !'))
                ;
            }
          },
        )
            ),
            Container(
              color: Colors.lightBlue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: TextFormField(
                    controller: msg,
                    onFieldSubmitted: (value) {
                       if (value.isNotEmpty) {
                                    final now = DateTime.now();
                                    String formatter =
                                        DateFormat('yMd').format(now);
                                    // String time = DateFormat.jms().toString();
                                    storeUser.collection("Messages").doc().set({
                                      'cid':'${auth.currentUser!.uid}${widget.id}',
                                      'fromId': auth.currentUser!.uid,
                                      'toId': widget.id,
                                      'messageId': value,
                                      'date': formatter,
                                      'time': now
                                    });
                                    // final message = Message(
                                    //     text: value,
                                    //     date: DateTime.now(),
                                    //     isSentByMe: true);
                                    // setState(() {
                                    //   messages.add(message);
                                    // });
                                    msg.clear();
                                  }
                    },
                    decoration:  InputDecoration(
                      suffixIcon: IconButton(onPressed: (){
                      if (msg.text.isNotEmpty) {
                                    final now = DateTime.now();
                                    String formatter =
                                        DateFormat('yMd').format(now);
                                    // String time = DateFormat.jms().toString();
                                    storeUser.collection("Messages").doc().set({
                                      'chatId':
                                          '${auth.currentUser!.uid}${widget.id}',
                                      'fromId': auth.currentUser!.uid,
                                      'toId': widget.id,
                                      'messageText': msg.text,
                                      'date': formatter,
                                      'time': now
                                    });
                                    msg.clear();
                                    }
                      }, icon:const Icon(Icons.send)),
                      contentPadding:const EdgeInsets.all(12),
                      hintText: 'Enter Message Here..',
                    ),
                  ),
                ),
              ),
            ),
          ],
)
        
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












//  GroupedListView(
//                   reverse: true,
//                   order: GroupedListOrder.DESC,
//                   useStickyGroupSeparators: true,
//                   floatingHeader: true,
//                   padding: const EdgeInsets.all(8),
//                   elements: messages,
//                   groupBy: (message) => DateTime(
//                         message.date.year,
//                         message.date.month,
//                         message.date.day,
//                       ),
//                   groupHeaderBuilder: (Message message) => SizedBox(
//                         height: 40,
//                         child: Center(
//                             child: Card(
//                           color: Theme.of(context).primaryColor,
//                           child: Padding(
//                             padding: const EdgeInsets.all(8),
//                             child: Text(
//                               DateFormat.yMMMd().format(message.date),
//                               style: const TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         )),
//                       ),
//                   itemBuilder: (context, Message message) => Align(
//                         alignment: message.isSentByMe
//                             ? Alignment.centerRight
//                             : Alignment.centerLeft,
//                         child: Card(
//                           elevation: 8,
//                           child: Padding(
//                             padding: const EdgeInsets.all(12),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(message.text),
//                                 SizedBox(height: 3,),
//                                 Text(DateFormat.jm().format(message.date),style: const TextStyle(
//                                                 color: Colors.black,
//                                                 fontSize: 10),
//                                             textAlign: TextAlign.end,)
//                               ],
//                             ),
//                           ),
//                         ),
//                       )),




