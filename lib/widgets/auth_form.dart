import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthForm extends StatefulWidget {
 final void Function(String email,String password,String username,bool isLogin) submitAuthForm ;
 AuthForm(this.submitAuthForm);


  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _fromKey = GlobalKey<FormState>();
  var isLogin=true;
  var _userEmail= '';
  var _userName='';
  var _userPassword='';

  void _trySave(){
    final isValid = _fromKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if(isValid)
      {
        _fromKey.currentState.save();
        print(_userPassword);
        widget.submitAuthForm(_userEmail,_userPassword,_userName,isLogin);
      }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _fromKey,
            child: Column(
              children: [
                TextFormField(
                  key : ValueKey('email'),
                  validator:(value){
                    if(value.isEmpty || !value.contains('@'))
                      {
                        return 'Please enter a valid emailaddress';
                      }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'User email'),
                  onSaved: (txtval){
                    _userEmail=txtval;
                  },

                ),
                if(!isLogin)
                TextFormField(
                  key : ValueKey('username'),
                  validator:(value){
                    if(value.isEmpty || value.length < 4 )
                    {
                      return 'Please enter a four charchter username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Username'),
                  onSaved: (txtval){
                    _userName=txtval;
                  },
                ),
                TextFormField(
                  key : ValueKey('password'),
                  validator:(value){
                    if(value.isEmpty || value.length < 4 )
                    {
                      return 'Please enter a Seven charchter password';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                  onSaved: (txtval){
                    _userPassword=txtval;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  child: Text( isLogin ? 'Login' : 'Signup'),
                  onPressed: _trySave,
                ),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text(isLogin ? 'Create new account' : 'I am already have an account'),
                  onPressed: () {
                    setState(() {
                      isLogin =!isLogin;
                    });

                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
