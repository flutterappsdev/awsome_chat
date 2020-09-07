
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import '../widgets/auth_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var isLoading = false;
  final _auth = FirebaseAuth.instance;
  void _submitAuthForm(String email, String password, String username,
      bool isAlreadyUser,BuildContext ctx) async {
    UserCredential authResult;
    try {
      setState(() {
        isLoading = true;
      });
      if (isAlreadyUser) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(authResult.user);
       await FirebaseFirestore.instance.collection('users').doc(authResult.user.uid).set({
          'username': username,
          'email' : email
        });
        setState(() {
          isLoading = false;
        });

      }
    }  catch (err) {
      setState(() {
        isLoading = false;
      });
      print('errr');
      var errmsg = 'An error occured please check you credentials';
      if (err != null) {
        errmsg = err.message;

        Scaffold.of(ctx).showSnackBar(
          SnackBar(
            content: Text(errmsg),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_submitAuthForm,isLoading),
    );
  }
}
