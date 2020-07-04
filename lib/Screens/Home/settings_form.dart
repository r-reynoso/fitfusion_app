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

  // form values
  String _currentFirstName;
  String _currentLastName;
  int _currentAge;
  int _currentWeight;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){

          UserData userData = snapshot.data;

          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
                  'Update your personal information.',
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height:20.0),
                Text(
                  'Enter your first name.',
                  style: TextStyle(fontSize: 18.0),
                ),
                TextFormField(
                  initialValue: userData.firstName,
                  decoration: textInputDecoration,
                  validator: (val) => val.isEmpty ? 'Plase enter your first name.' : null,
                  onChanged: (val) => setState(() => _currentFirstName = val),
                ),
                SizedBox(height:20.0),
                Text(
                  'Enter your last name.',
                  style: TextStyle(fontSize: 18.0),
                ),
                TextFormField(
                  initialValue: userData.lastName,
                  decoration: textInputDecoration,
                  validator: (val) => val.isEmpty ? 'Plase enter your last name.' : null,
                  onChanged: (val) => setState(() => _currentLastName = val),
                ),
                SizedBox(height:20.0),
                Text(
                  'Enter your age.',
                  style: TextStyle(fontSize: 18.0),
                ),
                // dropdown
                DropdownButtonFormField(
                  decoration: textInputDecoration,
                  value: _currentAge ?? userData.age,
                  items: ages.map((age){
                    return DropdownMenuItem(
                      value: age,
                      child: Text('$age'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentAge = val),
                ),
                SizedBox(height:20.0),
                // slider
                RaisedButton(
                  color: Colors.grey,
                  child: Text(
                    'Update',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()) {
                      await DatabaseService(uid: user.uid).updateUserData(
                        _currentFirstName ?? userData.firstName,
                        _currentLastName ?? userData.lastName,
                        _currentAge ?? userData.age,
                        _currentWeight ?? userData.weight
                      );
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          );
        } else {
          return Loading();
        }

      }
    );
  }
}
