import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'User email'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  child: Text('Login'),
                  onPressed: () {},
                ),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text('Register'),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
