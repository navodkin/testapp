import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/authenticate/authenticate.dart';
import 'package:flutter_application_1/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<TheUser>(context);
    
    //return either Home ore Authenticate widget
    if (user == null){
      return Authenticate();
    } else{
      return Home();
    }
  }
}