import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessages extends StatefulWidget {
  @override
  _NewMessagesState createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  final _controller = TextEditingController();
  String _enterMessasge = '';

  void _sendMessage(){
    final user = FirebaseAuth.instance.currentUser;
    FocusScope.of(context).unfocus();
    FirebaseFirestore.instance.collection('chat').add({
      'messages' : _enterMessasge,
      'createdAt' : Timestamp.now(),
      'UserId' : user.uid
    });
    _controller.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Send a message...' ),
            onChanged: (val){
              setState(() {
               _enterMessasge= val;
              });
            }),
          ),
         IconButton(
           icon: Icon(Icons.send),
           onPressed:  _enterMessasge.trim().isEmpty ? null : _sendMessage,
         )
        ],
      ),
    );
  }
}
