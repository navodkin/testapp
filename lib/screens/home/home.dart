import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth.dart'; 

class Home extends StatelessWidget {

final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Рыболовный спорт'),
        backgroundColor: Colors.blue[500],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Выход'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      )
    );
  }
}