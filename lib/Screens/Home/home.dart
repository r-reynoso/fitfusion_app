import 'package:fitfusionapp/Screens/Home/settings_form.dart';
import 'package:fitfusionapp/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fitfusionapp/Services/database.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:fitfusionapp/Screens/Home/user_info.dart';
import 'package:fitfusionapp/Models/userInfo.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return Container(
                padding: EdgeInsets.all(30), child: SettingsForm());
          });
    }

    return StreamProvider<List<Info>>.value(
        value: DatabaseService().user,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Fit Fusion'),
            backgroundColor: Colors.black,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.exit_to_app, color: Colors.white),
                label: Text(''),
                onPressed: () async {
                  await _auth.signOut();
                },
              )
            ],
          ),
          body: Center(),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Container(
              height: 60,
              child: new Row(
                  //mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.keyboard_arrow_right),
                      iconSize: 40,
                      onPressed: () {
                        print('Exercise');
                      },
                    ),
                    RaisedButton(
                      color: Colors.white,
                      elevation: 0,
                      textColor: Colors.white,
                      child: Text(
                        'Exercise',
                        style:
                            TextStyle(color: Colors.deepOrange, fontSize: 20),
                      ),
                      onPressed: () {
                        print('Exercise');
                      },
                    ),
                    RaisedButton(
                      color: Colors.white,
                      elevation: 0,
                      textColor: Colors.white,
                      child: Text(
                        'Diet',
                        style:
                            TextStyle(color: Colors.deepOrange, fontSize: 20),
                      ),
                      onPressed: () {
                        print('Exercise');
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.keyboard_arrow_left),
                      iconSize: 40,
                      onPressed: () {
                        print('Diet');
                      },
                    ),
                  ]),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepOrange,
            onPressed: () {
              _showSettingsPanel();
              SystemChrome.setPreferredOrientations(
                  [DeviceOrientation.portraitUp]);
            },
            tooltip: 'User Settings',
            child: Icon(Icons.account_circle),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          //body: Container(child: UserInfo())),
        ));
  }
}
