import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../chat/message_bubble.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  String loggedInUserId = '';
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUserId = user.uid;
        print('lolgged in user $loggedInUserId');
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chat').orderBy('createdAt',descending: true).snapshots(),
      builder: (ctx, chatnaoShot) {
        final document = chatnaoShot.data.documents;
        if (chatnaoShot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        return Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: document.length,
            itemBuilder: (ctx, index) => MessageBubble(
              document[index].get('messages'),document[index].get('UserId')==loggedInUserId
            ),
          ),
        );
      },
    );
  }
}
