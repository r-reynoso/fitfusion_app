import 'package:fitfusionapp/Services/auth.dart';
import 'package:fitfusionapp/Shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitfusionapp/Shared/constants.dart';
import 'package:fitfusionapp/Screens/Webview/Webview.dart';

Future navigateToWebwiew(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Webwiew()));
}

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.help, color: Color.fromARGB(255, 69, 83, 100)),
                  label: Text(''),
                  onPressed: () {
                    navigateToWebwiew(context);
                  },
                )
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
                        child: Image.asset('assets/images/logoSmallWhite.png'),
                      ),
                    ),
                    SizedBox(height: 45.0),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          'Login',
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
                        color: Color.fromARGB(255, 47, 150, 153),
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic results = await _auth
                                .signInWithEmailAndPassword(email, password);
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
                          'Register',
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
