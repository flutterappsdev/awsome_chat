import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('chats/tvlEvvZ5mAy4BTW0CvGC/messages')
              .snapshots(),
          builder: (ctx, streamSnapShots) {
            final document = streamSnapShots.data.documents;
            if(streamSnapShots.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: document.length,
              itemBuilder: (ctx, index) => Container(
                padding: EdgeInsets.all(10.00),
                child: Text(document[index].get('test')),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // FirebaseFirestore.instance.collection('chats/tvlEvvZ5mAy4BTW0CvGC/messages')
          //   .snapshots()
          // .listen((event) {
          //print(event.docs[0].get('test'));
          // event.docs.forEach((document) {
          // print(document.get('test'));
          //});
          FirebaseFirestore.instance.collection('chats/tvlEvvZ5mAy4BTW0CvGC/messages').add(
            {
              'test' : 'From add...'
            }
           );


        },
      ),
    );
  }
}
