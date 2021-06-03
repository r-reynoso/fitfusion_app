import 'package:fitfusionapp/Models/user.dart';
import 'package:fitfusionapp/Screens/Exercise/exercise.dart';
import 'package:fitfusionapp/Screens/Home/settings_form.dart';
import 'package:fitfusionapp/Shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:fitfusionapp/Services/database.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:fitfusionapp/Shared/constants.dart';

class Home extends StatelessWidget {
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

    double size = 30.0;
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Container(
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

              body: Center(
                child: Column(
                children: <Widget>[
                  SizedBox(height: 100.0),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(30.0, 10.0, 5.0, 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Name:',
                            style: TextStyle(
                                fontSize: size, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Text(
                                userData.firstName,
                                style: TextStyle(
                                    fontSize: size, fontWeight: FontWeight.normal
                                ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Text(
                              userData.lastName,
                              style: TextStyle(
                                  fontSize: size, fontWeight: FontWeight.normal
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )),

              bottomNavigationBar: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                child: Container(
                  height: 60,
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.keyboard_arrow_right,
                              color: Colors.black),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Exercise()),
                            );
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
                          icon: Icon(Icons.keyboard_arrow_left,
                              color: Colors.black),
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
          } else {
            return Loading();
          }
        });
  }
}
