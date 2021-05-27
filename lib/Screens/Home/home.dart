import 'package:fitfusionapp/Screens/Home/settings_form.dart';
import 'package:fitfusionapp/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fitfusionapp/Services/database.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:fitfusionapp/Screens/Home/user_info.dart';
import 'package:fitfusionapp/Models/userInfo.dart';
import 'package:fitfusionapp/Shared/constants.dart';

class Home extends StatelessWidget {
  //final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return Container(
                height: 535,
                padding: EdgeInsets.all(30),
                child: SettingsForm());
          });
    }

    return StreamProvider<List<Info>>.value(
        value: DatabaseService().user,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(''),
            backgroundColor: Colors.black,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.exit_to_app,
                    color: Color.fromARGB(255, 47, 150, 153)),
                label: Text(''),
                onPressed: () async {
                  asyncConfirmDialog(context);
                },
              )
            ],
          ),

          body: Center(child: UserInfo()),

          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Container(
              height: 60,
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon:
                          Icon(Icons.keyboard_arrow_right, color: Colors.black),
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
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      onPressed: () {
                        print('Exercise');
                      },
                    ),
                    Spacer(),
                    RaisedButton(
                      color: Colors.white,
                      elevation: 0,
                      textColor: Colors.white,
                      child: Text(
                        'Diet',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      onPressed: () {
                        print('Diet');
                      },
                    ),
                    IconButton(
                      icon:
                          Icon(Icons.keyboard_arrow_left, color: Colors.black),
                      iconSize: 40,
                      onPressed: () {
                        print('Diet');
                      },
                    ),
                  ]),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromARGB(255, 47, 150, 153),
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
