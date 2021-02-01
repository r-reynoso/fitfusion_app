import 'package:fitfusionapp/Models/user.dart';
import 'package:fitfusionapp/Services/database.dart';
import 'package:fitfusionapp/Shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:fitfusionapp/Shared/constants.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<int> ages = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80];
  final List<int> weight = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,333,234,235,236,237,238,239,240];
  final List<int> feet = [0,1,2,3,4,5,6,7,8];
  final List<int> inches = [0,1,2,3,4,5,6,7,8,9,10,11];
  final List gender = ['Male','Female'];

  // form values
  String _currentFirstName;
  String _currentLastName;
  String _currentGender;
  int _currentAge;
  int _currentWeight;
  int _currentFeet;
  int _currentInches;

  @override
  Widget build(BuildContext context) {
    GestureDetector(onHorizontalDragDown: (DragDownDetails details) {
      SystemChrome.setPreferredOrientations([]);
    });

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        'Update your personal information.',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        'Enter your first name.',
                        style: TextStyle(
                            fontSize: 10.0, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    initialValue: userData.firstName,
                    decoration: textInputDecoration.copyWith(
                        labelText: 'First name',
                        labelStyle: TextStyle(color: Colors.black)),
                    validator: (val) =>
                        val.isEmpty ? 'Please enter your first name.' : null,
                    onChanged: (val) => setState(() => _currentFirstName = val),
                  ),
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        'Enter your last name.',
                        style: TextStyle(
                            fontSize: 10.0, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    initialValue: userData.lastName,
                    decoration: textInputDecoration.copyWith(
                        labelText: 'Last name',
                        labelStyle: TextStyle(color: Colors.black)),
                    validator: (val) =>
                        val.isEmpty ? 'Please enter your last name.' : null,
                    onChanged: (val) => setState(() => _currentLastName = val),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            'Enter your age:   ',
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      // dropdown
                      Align(
                        alignment: Alignment.centerLeft,
                        child: DropdownButton(
                          value: _currentAge ?? userData.age,
                          items: ages.map((age) {
                            return DropdownMenuItem(
                              value: age,
                              child: Text('$age'),
                            );
                          }).toList(),
                          onChanged: (val) => setState(() => _currentAge = val),
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          child: Text(
                            'Enter your weight:   ',
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: DropdownButton(
                          value: _currentWeight ?? userData.weight,
                          items: weight.map((weight) {
                            return DropdownMenuItem(
                              value: weight,
                              child: Text('$weight'),
                            );
                          }).toList(),
                          onChanged: (val) =>
                              setState(() => _currentWeight = val),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            'Gender:   ',
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: DropdownButton(
                          value: _currentGender ?? userData.gender,
                          items: gender.map((gender) {
                            return DropdownMenuItem(
                              value: gender,
                              child: Text('$gender'),
                            );
                          }).toList(),
                          onChanged: (val) =>
                              setState(() => _currentGender = val),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        'Enter your height.',
                        style: TextStyle(
                            fontSize: 10.0, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      Text(
                        'Feet:   ',
                        style: TextStyle(
                            fontSize: 8.0, fontWeight: FontWeight.normal),
                      ),
                      DropdownButton(
                        value: _currentFeet ?? userData.feet,
                        items: feet.map((feet) {
                          return DropdownMenuItem(
                            value: feet,
                            child: Text('$feet'),
                          );
                        }).toList(),
                        onChanged: (val) => setState(() => _currentFeet = val),
                      ),
                      Text(
                        '   Inches:   ',
                        style: TextStyle(
                            fontSize: 8.0, fontWeight: FontWeight.normal),
                      ),
                      DropdownButton(
                        value: _currentInches ?? userData.inches,
                        items: inches.map((inches) {
                          return DropdownMenuItem(
                            value: inches,
                            child: Text('$inches'),
                          );
                        }).toList(),
                        onChanged: (val) =>
                            setState(() => _currentInches = val),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  ButtonTheme(
                      minWidth: double.infinity,
                      height: 60.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: RaisedButton(
                        color: Color.fromARGB(255, 47, 150, 153),
                        child: Text(
                          'Update',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await DatabaseService(uid: user.uid).updateUserData(
                              _currentFirstName ?? userData.firstName,
                              _currentLastName ?? userData.lastName,
                              _currentGender ?? userData.gender,
                              _currentAge ?? userData.age,
                              _currentWeight ?? userData.weight,
                              _currentFeet ?? userData.feet,
                              _currentInches ?? userData.inches,
                            );
                            Navigator.pop(context);
                            SystemChrome.setPreferredOrientations([]);
                          }
                        },
                      )),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
