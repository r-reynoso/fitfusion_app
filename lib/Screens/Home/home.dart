import 'package:fitfusionapp/Screens/Home/settings_form.dart';
import 'package:fitfusionapp/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fitfusionapp/Services/database.dart';
import 'package:provider/provider.dart';
import 'package:fitfusionapp/Screens/Home/user_info.dart';
import 'package:fitfusionapp/Models/userInfo.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm()
        );
      });
    }

    return StreamProvider<List<Info>>.value(
      value: DatabaseService().user,
      child: Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Fit Fusion'),
        backgroundColor: Colors.grey,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
          FlatButton.icon(
            icon: Icon(Icons.settings),
            label: Text('Settings'),
            onPressed: () => _showSettingsPanel(),
          )
        ],
      ),
      body: UserInfo()
      ),
    );
  }
}
