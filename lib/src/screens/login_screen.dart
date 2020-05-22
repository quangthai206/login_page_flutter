import 'package:flutter/material.dart';
import '../mixins/validator_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Validator {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com'
      ),
      validator: checkEmail,
      onSaved: (value) {
        email = value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
      ),
      validator: checkPassword,
      onSaved: (value) {
        password = value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blueAccent,
      child: Text('Submit'),
      onPressed: () {
        if(_formKey.currentState.validate()) {
          _formKey.currentState.save();

          if (email == 'admin@teneocto.io' && password == '123456') {
            print('Login successfully.');
            _formKey.currentState.reset();
          } else {
            print('Invalid email or password!');
          }
        }
      },
    );
  }
}
