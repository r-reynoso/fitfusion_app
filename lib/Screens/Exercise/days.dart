import 'package:fitfusionapp/Models/user.dart';
import 'package:fitfusionapp/Shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:fitfusionapp/Services/database.dart';
import 'package:provider/provider.dart';
import 'monday.dart';

class Days extends StatefulWidget {
  @override
  _DaysState createState() => _DaysState();
}

class _DaysState extends State<Days> {
  double size = 20.0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<ExerciseData>(
        stream: DatabaseService(uid: user.uid).exerciseData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MaterialApp(builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 0.8),
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    iconTheme: IconThemeData(
                      color: Color.fromARGB(255, 47, 150, 153),
                    ),
                    backgroundColor: Colors.black,
                    elevation: 0.0,
                  ),
                  body: Center(
                      child: Align(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          // Monday -------------------------------------------------------
                          SizedBox(height: 20),
                          SizedBox(
                            width: 380,
                            child: Container(
                              height: 140,
                              child: Card(
                                elevation: 2,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    SizedBox(height: 0),
                                    const ListTile(
                                      leading: Icon(Icons.calendar_today),
                                      title: Text('Monday'),
                                      subtitle: Text('WU'),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        FlatButton(
                                          child:
                                              const Icon(Icons.arrow_forward),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Monday()),
                                            );
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                ),
              );
            });
          } else {
            return Loading();
          }
        });
  }
}
