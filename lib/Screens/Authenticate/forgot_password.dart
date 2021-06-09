import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitfusionapp/Shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitfusionapp/Shared/constants.dart';
import '../../main.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool loading = false;

  // text field state
  String email;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: loading
          ? Loading()
          : Scaffold(
              backgroundColor: Colors.white,
              resizeToAvoidBottomInset: true,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                actions: <Widget>[
                  // FlatButton.icon(
                  //   icon: Icon(Icons.help, color: Color.fromARGB(255, 47, 150, 153)),
                  //   label: Text(''),
                  //   onPressed: () {
                  //     navigateToWebwiew(context);
                  //   },
                  // )
                ],
              ),
              body: SingleChildScrollView(
                padding: EdgeInsets.all(30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: SizedBox(
                          width: 190,
                          height: 190,
                          child:
                              Image.asset('assets/images/logoSmallWhite.png'),
                        ),
                      ),
                      SizedBox(height: 45.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            'Forgot Password?',
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
                            'Email address',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        autofocus: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: textInputDecoration.copyWith(
                            labelText: 'Enter email',
                            labelStyle: TextStyle(color: Colors.black)),
                        validator: (val) =>
                            val.isEmpty ? 'Enter a email.' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        children: <Widget>[
                            Text(
                              'You will receive a reset password email.',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 47, 150, 153),
                                  fontSize: 18.0),
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
                            'Rest Password',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            if (email != null) {
                              _auth.sendPasswordResetEmail(email: email);
                              Navigator.of(context).pop();
                            } else {
                              setState(() {
                                error = 'Please enter a email.';
                                loading = false;
                              });
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 20.0),
                      ButtonTheme(
                        minWidth: double.infinity,
                        height: 60.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: RaisedButton(
                          color: Colors.black,
                          child: Text(
                            'Back to Login',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()));
                          },
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
