import 'package:flutter/material.dart';
import 'package:fitfusionapp/Services/auth.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: Color.fromARGB(255, 47, 150, 153), width: 1.0)),
);

enum ConfirmAction { No, Yes }

Future<ConfirmAction> asyncConfirmDialog(BuildContext context) async {
  final AuthService _auth = AuthService();
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Log Off?', style: TextStyle(color: Colors.black)),
        content: const Text('Are you sure you want to log off?',
            style: TextStyle(color: Color.fromARGB(255, 47, 150, 153))),
        actions: <Widget>[
          FlatButton(
            child: const Text('Yes', style: TextStyle(color: Colors.black)),
            onPressed: () async {
              await _auth.signOut();
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: const Text('No', style: TextStyle(color: Colors.black)),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.No);
            },
          )
        ],
      );
    },
  );
}
