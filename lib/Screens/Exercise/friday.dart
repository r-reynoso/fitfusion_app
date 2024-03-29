import 'package:fitfusionapp/Models/user.dart';
import 'package:fitfusionapp/Shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:fitfusionapp/Services/database.dart';
import 'package:provider/provider.dart';

class Friday extends StatefulWidget {
  @override
  _FridayState createState() => _FridayState();
}

class _FridayState extends State<Friday> {
  double size = 20.0;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<ExerciseData>(
        stream: DatabaseService(uid: user.uid).exerciseData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ExerciseData exerciseData = snapshot.data;
            return Container(
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
                              // Friday -------------------------------------------------------
                              SizedBox(height: 20),
                              SizedBox(
                                width: 380,
                                child: Container(
                                  height: 700,
                                  child: Card(
                                    elevation: 5,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          SizedBox(height: 0),
                                          const ListTile(
                                            leading: Icon(Icons.calendar_today),
                                            title: Text('Friday'),
                                            subtitle: Text('Cardio'),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(width: 72),
                                              Text(exerciseData.fridayExercise1),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(width: 72),
                                              Text(
                                                  '--------------------------------------------'),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          const ListTile(
                                            leading: Icon(Icons.arrow_downward),
                                            title: Text('Workout'),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(width: 72),
                                              Text(exerciseData.fridayExercise2),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(width: 72),
                                              Text(exerciseData.fridayExercise3),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(width: 72),
                                              Text(exerciseData.fridayExercise4),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(width: 72),
                                              Text(exerciseData.fridayExercise5),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(width: 72),
                                              Text(exerciseData.fridayExercise6),
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
                                                  '--------------------------------------------'),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(width: 72),
                                              Text(exerciseData.fridayExercise7),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(width: 72),
                                              Text(exerciseData.fridayExercise8),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(width: 72),
                                              Text(exerciseData.fridayExercise9),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(width: 72),
                                              Text(exerciseData.fridayExercise10),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(width: 72),
                                              Text(exerciseData.fridayExercise11),
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
                                                  '--------------------------------------------'),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(width: 72),
                                              Text(exerciseData.fridayExercise12),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(width: 72),
                                              Text(exerciseData.fridayExercise13),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(width: 72),
                                              Text(exerciseData.fridayExercise14),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(width: 72),
                                              Text(exerciseData.fridayExercise15),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              const SizedBox(width: 72),
                                              Text(exerciseData.fridayExercise16),
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
                                                  '--------------------------------------------'),
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

                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ));
          } else {
            return Loading();
          }
        });
  }
}
