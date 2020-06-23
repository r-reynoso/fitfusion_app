import 'package:flutter/material.dart';
import 'package:fitfusionapp/Shared/constants.dart';

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update your personal information.',
            style: TextStyle(fontSize: 18.0),
          ),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Plase enter your first name.' : null,
            onChanged: (val) => setState(() => _currentFirstName = val),
          ),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Plase enter your first name.' : null,
            onChanged: (val) => setState(() => _currentLastName = val),
          ),
          SizedBox(height:20.0),
          // dropdown
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: _currentAge ?? 0,
            items: ages.map((age){
              return DropdownMenuItem(
                value: age,
                child: Text('$age ages'),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentAge = val),
          ),
          // slider
          RaisedButton(
            color: Colors.grey,
            child: Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              print(_currentFirstName);
              print(_currentLastName);
              print(_currentAge);
            },
          ),
        ],
      ),
    );
  }
}
