// 
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
            .where('fromId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .orderBy('messageTime', descending: true)
            .snapshots(),
        builder: (context, fromSnapshot) {
          if (fromSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Messages')
                .where('toId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .orderBy('messageTime', descending: true)
                .snapshots(),
            builder: (context, toSnapshot) {
              if (toSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              List<String> chattedUsers = [];
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

              if (chattedUsers.isEmpty) {
                return Center(child: Text('No Chats'));
              }

              return ListView.builder(
                itemCount: chattedUsers.length,
                itemBuilder: (context, index) {
                  return StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(chattedUsers[index])
                        .snapshots(),
                    builder: (context, userSnapshot) {
                      if (userSnapshot.connectionState == ConnectionState.waiting) {
                        return ListTile(
                          title: Text(chattedUsers[index]),
                        );
                      }

                      String name = userSnapshot.data!['name'];
                      String profileImage=userSnapshot.data!['profileImage'];

                      return StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Messages')
                            .where('fromId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                            .where('toId', isEqualTo: chattedUsers[index])
                            .orderBy('messageTime', descending: true)
                            .limit(1)
                            .snapshots(),
                        builder: (context, lastMessageSnapshot) {
                          if (lastMessageSnapshot.connectionState == ConnectionState.waiting) {
                            return ListTile(
                              title: Text(name),
                              subtitle: Text(''),
                            );
                          }

                          String lastMessage = '';

                          if (lastMessageSnapshot.data!.docs.isNotEmpty) {
                            lastMessage = lastMessageSnapshot.data!.docs.first['messageText'];
                          }

                          return ListTile(
                            title: Text(name),
                            
                            subtitle: Text(lastMessage),
                            onTap: () {
                              // navigate to chat screen for the selected user
                            },
                          );
                        },
                      );
                    },
                  );
                },
              );
            }
          );
        }
      ),
    );
  }
}

