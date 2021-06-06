import 'package:fitfusionapp/Models/user.dart';
import 'package:fitfusionapp/Shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:fitfusionapp/Services/database.dart';
import 'package:provider/provider.dart';

class Exercise extends StatefulWidget {
  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  double size = 20.0;
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<ExerciseData>(
      stream: DatabaseService(uid: user.uid).exerciseData,
        builder: (context, snapshot) {
            if(snapshot.hasData){
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
                    body: Center (
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    child: Text(
                                      'Monday',
                                      style: TextStyle(
                                        fontSize: size, fontWeight: FontWeight.normal
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(00),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    child: Text(
                                      exerciseData.mondayExercise,
                                      style: TextStyle(
                                          fontSize: size, fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  )
              );

            } else {
              return Loading();
            }
        });
  }
}


