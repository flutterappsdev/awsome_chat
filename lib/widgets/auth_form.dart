import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthForm extends StatefulWidget {
 var isLoading;
  final void Function(String email,String password,String username,bool isLogin,BuildContext context) submitAuthForm ;
 AuthForm(this.submitAuthForm,this.isLoading);


  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _fromKey = GlobalKey<FormState>();
  var isAlreadyUser=true;
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
        widget.submitAuthForm(_userEmail.trim(),_userPassword.trim(),_userName.trim(),isAlreadyUser,context);
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
                if(!isAlreadyUser)
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
                widget.isLoading ? CircularProgressIndicator() :
                RaisedButton(
                  child: Text( isAlreadyUser ? 'Login' : 'Signup'),
                  onPressed: _trySave,
                ),
                widget.isLoading ? CircularProgressIndicator() :
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text(isAlreadyUser ? 'Create new account' : 'I am already have an account'),
                  onPressed: () {
                    setState(() {
                      isAlreadyUser =!isAlreadyUser;
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
