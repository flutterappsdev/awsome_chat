import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/chat_screen.dart';
import './screens/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch : Colors.pink,
        backgroundColor: Colors.pink,
        accentColor: Colors.purple,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.pink,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )
        )

      ),
      home: ChatHome() ,
    );
  }
}

class ChatHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Awsome Chat'),
      ),
      body: AuthScreen(),
    );
  }
}
