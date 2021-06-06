import 'package:fitfusionapp/Models/user.dart';
import 'package:fitfusionapp/Screens/Exercise/exercise.dart';
import 'package:fitfusionapp/Screens/Home/settings_form.dart';
import 'package:fitfusionapp/Shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitfusionapp/Services/database.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:fitfusionapp/Shared/constants.dart';
import 'dart:math';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return Container(
                height: 700,
                padding: EdgeInsets.all(30),
                child: SettingsForm());
          });
    }

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            final feet = userData.feet;
            final inches = userData.inches;
            final weight = userData.weight;
            final bmi = (weight/(pow(((feet*12)+inches),2)))*703;
            return Container(
                child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Colors.white,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: AppBar(
                      centerTitle: true,
                      leading: Padding(
                        padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Icon(
                          Icons.settings,
                          size: 30,
                          color: Color.fromARGB(255, 47, 150, 153),
                        ),
                      ),
                      backgroundColor: Colors.black,
                      elevation: 0.0,
                      actions: <Widget>[
                        FlatButton.icon(
                          icon: Icon(Icons.exit_to_app,
                              size: 30,
                              color: Color.fromARGB(255, 47, 150, 153)),
                          label: Text(''),
                          onPressed: () async {
                            asyncConfirmDialog(context);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),

              body: Center(
                  child: Align(
                alignment: Alignment(0, -0.9),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 390,
                        child: Container(
                          height: 370,
                          child: Card(
                            elevation: 1,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                SizedBox(height: 20),
                                CircleAvatar(
                                  radius: 65,
                                  child: ClipOval(
                                    child: SizedBox(
                                        child: Image.asset(
                                            'assets/images/logoSmall.png',
                                            fit: BoxFit.contain)),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const SizedBox(width: 0),
                                    Text(userData.firstName +
                                        ' ' +
                                        userData.lastName),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const SizedBox(width: 0),
                                    Text('r-reynoso@live.com'),
                                  ],
                                ),
                                const ListTile(
                                  leading: Icon(Icons.album),
                                  title: Text('Your Personal Physical Data'),
                                  subtitle: Text(
                                      'Can be change on the user settings.'),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(width: 72),
                                    Text('Age: '),
                                    Text(userData.age.toString()),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(width: 72),
                                    Text('Gender: '),
                                    Text(userData.gender),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(width: 72),
                                    Text('Height: '),
                                    Text(userData.feet.toString() +
                                        ' ' +
                                        'Feet ' +
                                        userData.inches.toString() +
                                        ' ' +
                                        'Inches'),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(width: 72),
                                    Text('Weight: '),
                                    Text(userData.weight.toString() +
                                        ' ' +
                                        'pounds'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //-------------------------------------------------------
                      SizedBox(
                        width: 390,
                        child: Container(
                          height: 320,
                          child: Card(
                            elevation: 1,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                SizedBox(height: 10),
                                const ListTile(
                                  leading: Icon(Icons.info),
                                  title: Text('Body Mass Index'),
                                  subtitle: Text(
                                      'Screening method for weight category.'),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(width: 72),
                                    Text('-------------------        '),
                                    Text('-------------------------------'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(width: 72),
                                    Text('BMI                       '),
                                    Text('Nutritional Status'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(width: 72),
                                    Text('-------------------        '),
                                    Text('-------------------------------'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(width: 72),
                                    Text('Below 18.5          '),
                                    Text('Underweight'),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(width: 72),
                                    Text('18.5 - 24.9           '),
                                    Text('Normal Weight'),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(width: 72),
                                    Text('25.0 - 29.9           '),
                                    Text('Pre Obesity'),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(width: 72),
                                    Text('30.0 - 34.9           '),
                                    Text('Obesity Class 1'),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(width: 72),
                                    Text('-------------------        '),
                                    Text('-------------------------------'),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(width: 72),
                                    Text('Your body mass index is:  ' + bmi.toStringAsFixed(2) + '.'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),

              bottomNavigationBar: BottomAppBar(
                elevation: 5,
                shape: const CircularNotchedRectangle(),
                child: Container(
                  height: 60,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                            child: Text(
                              'Exercise',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Exercise()),
                            );
                          },
                        ),
                        Spacer(),
                        FlatButton(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 70, 0),
                            child: Text(
                              'Diet',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Exercise()),
                            );
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
