import 'package:fitfusionapp/Screens/Authenticate/authenticate.dart';
import 'package:fitfusionapp/Screens/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitfusionapp/Models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);

    // Return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
