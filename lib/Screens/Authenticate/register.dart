import 'package:fitfusionapp/Services/auth.dart';
import 'package:fitfusionapp/Shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:fitfusionapp/Shared/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
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
                        child: Image.asset('assets/images/logoSmallWhite.png'),
                      ),
                    ),
                    SizedBox(height: 45.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 40.0, fontWeight: FontWeight.normal),
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
                      validator: (val) => val.isEmpty ? 'Enter a email.' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                        autofocus: false,
                        decoration: textInputDecoration.copyWith(
                            labelText: 'Enter password',
                            labelStyle: TextStyle(color: Colors.black)),
                        validator: (val) =>
                            val.length < 6 ? 'Minimum 6 char long.' : null,
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        }),
                    SizedBox(height: 30.0),
                    ButtonTheme(
                      minWidth: double.infinity,
                      height: 60.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: RaisedButton(
                        color: Colors.deepOrange,
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic results = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (results != null) {
                              setState(() {
                                error = results;
                                loading = false;
                              });
                            }
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
                          widget.toggleView();
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
          );
  }
}
