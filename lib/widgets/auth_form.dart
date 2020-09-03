import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _fromKey = GlobalKey<FormState>();
  void _trySave(){
    final isValid = _fromKey.currentState.validate();
    if(isValid)
      {
        _fromKey.currentState.save();
      }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _fromKey,
            child: Column(
              children: [
                TextFormField(
                  validator:(value){
                    if(value.isEmpty || !value.contains('@'))
                      {
                        return 'Please enter a valid emailaddress';
                      }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'User email'),
                ),
                TextFormField(
                  validator:(value){
                    if(value.isEmpty || value.length < 4 )
                    {
                      return 'Please enter a four charchter username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                TextFormField(
                  validator:(value){
                    if(value.isEmpty || value.length < 4 )
                    {
                      return 'Please enter a Seven charchter password';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  child: Text('Login'),
                  onPressed: _trySave,
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
