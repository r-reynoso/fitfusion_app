import 'package:fitfusionapp/Models/user.dart';
import 'package:fitfusionapp/Shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:fitfusionapp/Services/database.dart';
import 'package:provider/provider.dart';

class Monday extends StatefulWidget {
  @override
  _MondayState createState() => _MondayState();
}

class _MondayState extends State<Monday> {
  double size = 20.0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<ExerciseData>(
        stream: DatabaseService(uid: user.uid).exerciseData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ExerciseData exerciseData = snapshot.data;
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
                    child: Column(
                      children: <Widget>[
                        // Monday -------------------------------------------------------
                        SizedBox(height: 20),
                        SizedBox(
                          width: 380,
                          child: Container(
                            height: 500,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(width: 72),
                                      Text(exerciseData.mondayExercise1),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(width: 72),
                                      Text(
                                          '--------------------------------------------------------'),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(width: 72),
                                      Text(exerciseData.mondayExercise2),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(width: 72),
                                      Text(exerciseData.mondayExercise3),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(width: 72),
                                      Text(exerciseData.mondayExercise4),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(width: 72),
                                      Text('Rest 1 min'),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(width: 72),
                                      Text(
                                          '--------------------------------------------------------'),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(width: 72),
                                      Text(exerciseData.mondayExercise5),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(width: 72),
                                      Text(exerciseData.mondayExercise6),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(width: 72),
                                      Text(exerciseData.mondayExercise7),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(width: 72),
                                      Text('Rest 1 min'),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(width: 72),
                                      Text(
                                          '--------------------------------------------------------'),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(width: 72),
                                      Text(exerciseData.mondayExercise8),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(width: 72),
                                      Text(exerciseData.mondayExercise9),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(width: 72),
                                      Text(exerciseData.mondayExercise10),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(width: 72),
                                      Text('Stretch'),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      const SizedBox(width: 72),
                                      Text(
                                          '--------------------------------------------------------'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
