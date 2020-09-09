import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  MessageBubble(this.message,this.isMe);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          decoration: BoxDecoration(
            color: isMe ? Colors.grey[300] : Colors.tealAccent,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.fromLTRB(5, 10, 5, 16),
          margin: EdgeInsets.fromLTRB(0, 4, 0, 8),
          child: Text(
            message,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}
