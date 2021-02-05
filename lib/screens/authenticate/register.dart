import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:flutter_application_1/shared/constants.dart';

class Register extends StatefulWidget {

final Function toggleView;
Register({ this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

    //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Регистрация'),
        actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Войти'),
              onPressed: () {
                widget.toggleView();
              },
              ),

          ],

      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Введите email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                obscureText: true,
                validator: (val) => val.length < 6 ? 'Введите пароль из 6 знаков или больше' : null,
                onChanged: (val) {
                  setState(() => password = val);
                }
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Зарегистрироваться',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()){
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() => error = 'Пожалуйста, проверьте email');
                    }
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      )
    );
  }
}