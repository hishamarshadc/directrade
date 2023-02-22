
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_project/presentation/customer/screens/chat/chat_message_page.dart';

class ChatListPage extends StatefulWidget {
  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recent Chats'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Messages')
              .where('fromId',
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .orderBy('time', descending: true)
              .snapshots(),
          builder: (context, fromSnapshot) {
            if (fromSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Messages')
                    .where('toId',
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .orderBy('time', descending: true)
                    .snapshots(),
                builder: (context, toSnapshot) {
                  if (toSnapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if(toSnapshot.hasError){
                    return Text('Error:${toSnapshot.error}');
                  }
                  if(fromSnapshot.hasError){
                    return Text('Error:${fromSnapshot.error}');
                  }
                  List<String> chattedUsers = [];
                  if(toSnapshot.data==null&&fromSnapshot.data==null){
                        chattedUsers = [];
                  }else if(fromSnapshot.data==null){
                          toSnapshot.data!.docs.forEach((doc) {
                    if (!chattedUsers.contains(doc['fromId'])) {
                      chattedUsers.add(doc['fromId']);
                    }
                  });              
                  }else if(toSnapshot.data==null){
                      fromSnapshot.data!.docs.forEach((doc) {
                    if (!chattedUsers.contains(doc['toId'])) {
                      chattedUsers.add(doc['toId']);
                    }
                  });
                  }else{
                    toSnapshot.data!.docs.forEach((doc) {
                    if (!chattedUsers.contains(doc['fromId'])) {
                      chattedUsers.add(doc['fromId']);
                    }
                  }); 
                  fromSnapshot.data!.docs.forEach((doc) {
                    if (!chattedUsers.contains(doc['toId'])) {
                      chattedUsers.add(doc['toId']);
                    }
                  });
                  }

                  if (chattedUsers.isEmpty) {
                    return Center(child: Text('No Chats'));
                  }

                  return ListView.builder(
                    itemCount: chattedUsers.length,
                    itemBuilder: (context, index) {
                      return StreamBuilder<DocumentSnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Users')
                            .doc(chattedUsers[index])
                            .snapshots(),
                        builder: (context, userSnapshot) {
                          if (userSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return ListTile(
                              title: Text(chattedUsers[index]),
                            );
                          }

                          String name = userSnapshot.data!['name'];
                          DocumentSnapshot? document = userSnapshot.data;
                          // String profileImage =
                          //     userSnapshot.data?['profileImage'];

                          return StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Messages')
                                .where('fromId',
                                    isEqualTo:
                                        FirebaseAuth.instance.currentUser!.uid)
                                .where('toId', isEqualTo: chattedUsers[index])
                                .orderBy('time', descending: true)
                                .limit(1)
                                .snapshots(),
                            builder: (context, lastMessageSnapshot) {
                              if (lastMessageSnapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return ListTile(
                                  title: Text(name),
                                  subtitle: Text(''),
                                );
                              }

                              String lastMessage = '';
                              // String time=;
                              if (lastMessageSnapshot.data!.docs.isNotEmpty) {
                                lastMessage = lastMessageSnapshot
                                    .data!.docs.first['messageText'];
                              }

                              return ListTile(
                                title: Text(name),
                                leading: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.green,
                                  backgroundImage:
                                      AssetImage('assets/images/seller.jpg'),
                                ),
                                subtitle: Text(lastMessage),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatMessagePage(id:chattedUsers[index],name:name),));
                                  // navigate to chat screen for the selected user
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                });
          }),
    );
  }
}
