import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatScreenTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chap app'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collectionGroup('chats/tvlEvvZ5mAy4BTW0CvGC/messages')
            .snapshots(),
        builder: (ctx, streamSnapShort) {
          final document = streamSnapShort.data.documents;
          return ListView.builder(
            itemCount: document.lemgth,
            itemBuilder: (ctx, index) {
              return Container(
                padding: EdgeInsets.all(10),
                child: Text(document[index].get('test')),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collectionGroup('chats/tvlEvvZ5mAy4BTW0CvGC/messages')
              .snapshots()
              .listen((event) {
            event.docs.forEach((element) {
              element.get('test');
            });
          });
        },
      ),
    );
  }
}
