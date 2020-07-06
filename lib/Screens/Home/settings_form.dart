import 'package:fitfusionapp/Models/user.dart';
import 'package:fitfusionapp/Services/database.dart';
import 'package:fitfusionapp/Shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:fitfusionapp/Shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<int> ages = [0, 1, 2, 3, 4];
  final List<int> weight = [0, 1, 2, 3, 4];
  final List<int> feet = [0, 1, 2, 3, 4];
  final List<int> inches = [0, 1, 2, 3, 4];

  // form values
  String _currentFirstName;
  String _currentLastName;
  int _currentAge;
  int _currentWeight;
  int _currentFeet;
  int _currentInches;

  @override
  Widget build(BuildContext context) {
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
                            fontSize: 30.0, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        'Enter your first name.',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.firstName,
                    decoration: textInputDecoration.copyWith(
                        labelText: 'First name',
                        labelStyle: TextStyle(color: Colors.black)),
                    validator: (val) =>
                        val.isEmpty ? 'Please enter your first name.' : null,
                    onChanged: (val) => setState(() => _currentFirstName = val),
                  ),
                  SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        'Enter your last name.',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.lastName,
                    decoration: textInputDecoration.copyWith(
                        labelText: 'Last name',
                        labelStyle: TextStyle(color: Colors.black)),
                    validator: (val) =>
                        val.isEmpty ? 'Please enter your last name.' : null,
                    onChanged: (val) => setState(() => _currentLastName = val),
                  ),
                  SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        'Enter your age.',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.normal),
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
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        'Enter your weight.',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: DropdownButton(
                      value: _currentWeight ?? userData.weight,
                      items: weight.map((weight) {
                        return DropdownMenuItem(
                          value: weight,
                          child: Text('$weight'),
                        );
                      }).toList(),
                      onChanged: (val) => setState(() => _currentWeight = val),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        'Enter your height.',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      Text(
                        'Feet:   ',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.normal),
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
                            fontSize: 15.0, fontWeight: FontWeight.normal),
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
                        color: Colors.deepOrange,
                        child: Text(
                          'Update',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await DatabaseService(uid: user.uid).updateUserData(
                              _currentFirstName ?? userData.firstName,
                              _currentLastName ?? userData.lastName,
                              _currentAge ?? userData.age,
                              _currentWeight ?? userData.weight,
                              _currentFeet ?? userData.feet,
                              _currentInches ?? userData.inches,
                            );
                            Navigator.pop(context);
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
