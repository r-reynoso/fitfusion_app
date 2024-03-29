import 'package:fitfusionapp/Screens/wrapper.dart';
import 'package:fitfusionapp/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:fitfusionapp/Models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return WillPopScope(
      onWillPop: () async => false,
      child: StreamProvider<User>.value(
          value: AuthService().user,
          child: MaterialApp(
            home: Wrapper(),
          )),
    );
  }
}
