import 'package:fitfusionapp/Models/user.dart';
import 'package:fitfusionapp/Screens/Exercise/saturday.dart';
import 'package:fitfusionapp/Screens/Exercise/sunday.dart';
import 'package:fitfusionapp/Screens/Exercise/thursday.dart';
import 'package:fitfusionapp/Screens/Exercise/tuesday.dart';
import 'package:fitfusionapp/Screens/Exercise/wednesday.dart';
import 'package:fitfusionapp/Shared/constants.dart';
import 'package:fitfusionapp/Shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:fitfusionapp/Services/database.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'friday.dart';
import 'monday.dart';

class Days extends StatefulWidget {
  @override
  _DaysState createState() => _DaysState();
}

class _DaysState extends State<Days> {
  double size = 20.0;

  @override
  Widget build(BuildContext context) {
    var d = DateTime.now();
    var weekDay = d.weekday;
    var mon = d.subtract(Duration(days: weekDay - 1));
    var tue = d.subtract(Duration(days: weekDay - 2));
    var wed = d.subtract(Duration(days: weekDay - 3));
    var thr = d.subtract(Duration(days: weekDay - 4));
    var fri = d.subtract(Duration(days: weekDay - 5));
    var sat = d.subtract(Duration(days: weekDay - 6));
    var sun = d.subtract(Duration(days: weekDay - 7));

    var monday = DateFormat.yMd().format(mon);
    var tuesday = DateFormat.yMd().format(tue);
    var wednesday = DateFormat.yMd().format(wed);
    var thursday = DateFormat.yMd().format(thr);
    var friday = DateFormat.yMd().format(fri);
    var saturday = DateFormat.yMd().format(sat);
    var sunday = DateFormat.yMd().format(sun);

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
                              SizedBox(height: 20),
                              SizedBox(
                                width: 380,
                                child: Container(
                                  height: 275,
                                  child: Card(
                                    elevation: 2,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(height: 20),
                                        CircleAvatar(
                                          radius: 65,
                                          child: ClipOval(
                                            child: SizedBox(
                                                child: Image.asset(
                                                    'assets/images/logoSmall.png',
                                                    fit: BoxFit.contain)),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        const ListTile(
                                          leading: Icon(Icons.info_outline),
                                          title: Text('Exercise Routine By Days'),
                                          subtitle: Text(
                                              'Select which day is your routine today.'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // Monday -------------------------------------------------------
                              SizedBox(height: 20),
                              SizedBox(
                                width: 380,
                                child: Container(
                                  height: 150,
                                  child: Card(
                                    elevation: 2,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(height: 0),
                                        const ListTile(
                                          leading: Icon(Icons.calendar_today),
                                          title: Text('Monday'),
                                          subtitle: Text('Routine'),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            const SizedBox(width: 72),
                                            Text('$monday'),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                            FlatButton(
                                              child: const Icon(Icons.arrow_forward),
                                              onPressed: () {
                                                if (exerciseData.mondayExercise1 == '' &&
                                                    exerciseData.mondayExercise2 ==
                                                        '' &&
                                                    exerciseData.mondayExercise3 ==
                                                        '' &&
                                                    exerciseData.mondayExercise4 ==
                                                        '' &&
                                                    exerciseData.mondayExercise5 ==
                                                        '' &&
                                                    exerciseData.mondayExercise6 ==
                                                        '' &&
                                                    exerciseData.mondayExercise7 ==
                                                        '' &&
                                                    exerciseData.mondayExercise8 ==
                                                        '' &&
                                                    exerciseData.mondayExercise9 ==
                                                        '' &&
                                                    exerciseData.mondayExercise10 ==
                                                        '' &&
                                                    exerciseData.mondayExercise11 ==
                                                        '' &&
                                                    exerciseData.mondayExercise12 ==
                                                        '' &&
                                                    exerciseData.mondayExercise13 ==
                                                        '' &&
                                                    exerciseData.mondayExercise14 ==
                                                        '' &&
                                                    exerciseData.mondayExercise15 ==
                                                        '' &&
                                                    exerciseData.mondayExercise16 ==
                                                        '') {
                                                  asyncConfirmDialog1(context);
                                                } else {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => Monday()),
                                                  );
                                                }
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
                              // Tuesday -------------------------------------------------------
                              SizedBox(height: 20),
                              SizedBox(
                                width: 380,
                                child: Container(
                                  height: 150,
                                  child: Card(
                                    elevation: 2,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(height: 0),
                                        const ListTile(
                                          leading: Icon(Icons.calendar_today),
                                          title: Text('Tuesday'),
                                          subtitle: Text('Routine'),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            const SizedBox(width: 72),
                                            Text('$tuesday'),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                            FlatButton(
                                              child: const Icon(Icons.arrow_forward),
                                              onPressed: () {
                                                if (exerciseData.tuesdayExercise1 == '' &&
                                                    exerciseData.tuesdayExercise2 ==
                                                        '' &&
                                                    exerciseData.tuesdayExercise3 ==
                                                        '' &&
                                                    exerciseData.tuesdayExercise4 ==
                                                        '' &&
                                                    exerciseData.tuesdayExercise5 ==
                                                        '' &&
                                                    exerciseData.tuesdayExercise6 ==
                                                        '' &&
                                                    exerciseData.tuesdayExercise7 ==
                                                        '' &&
                                                    exerciseData.tuesdayExercise8 ==
                                                        '' &&
                                                    exerciseData.tuesdayExercise9 ==
                                                        '' &&
                                                    exerciseData.tuesdayExercise10 ==
                                                        '' &&
                                                    exerciseData.tuesdayExercise11 ==
                                                        '' &&
                                                    exerciseData.tuesdayExercise12 ==
                                                        '' &&
                                                    exerciseData.tuesdayExercise13 ==
                                                        '' &&
                                                    exerciseData.tuesdayExercise14 ==
                                                        '' &&
                                                    exerciseData.tuesdayExercise15 ==
                                                        '' &&
                                                    exerciseData.tuesdayExercise16 ==
                                                        '') {
                                                  asyncConfirmDialog1(context);
                                                } else {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => Tuesday()),
                                                  );
                                                }
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
                              // Wednesday -------------------------------------------------------
                              SizedBox(height: 20),
                              SizedBox(
                                width: 380,
                                child: Container(
                                  height: 150,
                                  child: Card(
                                    elevation: 2,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(height: 0),
                                        const ListTile(
                                          leading: Icon(Icons.calendar_today),
                                          title: Text('Wednesday'),
                                          subtitle: Text('Routine'),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            const SizedBox(width: 72),
                                            Text('$wednesday'),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                            FlatButton(
                                              child: const Icon(Icons.arrow_forward),
                                              onPressed: () {
                                                if (exerciseData.wednesdayExercise1 == '' &&
                                                    exerciseData.wednesdayExercise2 ==
                                                        '' &&
                                                    exerciseData.wednesdayExercise3 ==
                                                        '' &&
                                                    exerciseData.wednesdayExercise4 ==
                                                        '' &&
                                                    exerciseData.wednesdayExercise5 ==
                                                        '' &&
                                                    exerciseData.wednesdayExercise6 ==
                                                        '' &&
                                                    exerciseData.wednesdayExercise7 ==
                                                        '' &&
                                                    exerciseData.wednesdayExercise8 ==
                                                        '' &&
                                                    exerciseData.wednesdayExercise9 ==
                                                        '' &&
                                                    exerciseData.wednesdayExercise10 ==
                                                        '' &&
                                                    exerciseData.wednesdayExercise11 ==
                                                        '' &&
                                                    exerciseData.wednesdayExercise12 ==
                                                        '' &&
                                                    exerciseData.wednesdayExercise13 ==
                                                        '' &&
                                                    exerciseData.wednesdayExercise14 ==
                                                        '' &&
                                                    exerciseData.wednesdayExercise15 ==
                                                        '' &&
                                                    exerciseData.wednesdayExercise16 ==
                                                        '') {
                                                  asyncConfirmDialog1(context);
                                                } else {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => Wednesday()),
                                                  );
                                                }
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
                              // Thursday -------------------------------------------------------
                              SizedBox(height: 20),
                              SizedBox(
                                width: 380,
                                child: Container(
                                  height: 150,
                                  child: Card(
                                    elevation: 2,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(height: 0),
                                        const ListTile(
                                          leading: Icon(Icons.calendar_today),
                                          title: Text('Thursday'),
                                          subtitle: Text('Routine'),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            const SizedBox(width: 72),
                                            Text('$thursday'),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                            FlatButton(
                                              child: const Icon(Icons.arrow_forward),
                                              onPressed: () {
                                                if (exerciseData.thursdayExercise1 == '' &&
                                                    exerciseData.thursdayExercise2 ==
                                                        '' &&
                                                    exerciseData.thursdayExercise3 ==
                                                        '' &&
                                                    exerciseData.thursdayExercise4 ==
                                                        '' &&
                                                    exerciseData.thursdayExercise5 ==
                                                        '' &&
                                                    exerciseData.thursdayExercise6 ==
                                                        '' &&
                                                    exerciseData.thursdayExercise7 ==
                                                        '' &&
                                                    exerciseData.thursdayExercise8 ==
                                                        '' &&
                                                    exerciseData.thursdayExercise9 ==
                                                        '' &&
                                                    exerciseData.thursdayExercise10 ==
                                                        '' &&
                                                    exerciseData.thursdayExercise11 ==
                                                        '' &&
                                                    exerciseData.thursdayExercise12 ==
                                                        '' &&
                                                    exerciseData.thursdayExercise13 ==
                                                        '' &&
                                                    exerciseData.thursdayExercise14 ==
                                                        '' &&
                                                    exerciseData.thursdayExercise15 ==
                                                        '' &&
                                                    exerciseData.thursdayExercise16 ==
                                                        '') {
                                                  asyncConfirmDialog1(context);
                                                } else {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => Thursday()),
                                                  );
                                                }
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
                              // Friday -------------------------------------------------------
                              SizedBox(height: 20),
                              SizedBox(
                                width: 380,
                                child: Container(
                                  height: 150,
                                  child: Card(
                                    elevation: 2,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(height: 0),
                                        const ListTile(
                                          leading: Icon(Icons.calendar_today),
                                          title: Text('Friday'),
                                          subtitle: Text('Routine'),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            const SizedBox(width: 72),
                                            Text('$friday'),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                            FlatButton(
                                              child: const Icon(Icons.arrow_forward),
                                              onPressed: () {
                                                if (exerciseData.fridayExercise1 == '' &&
                                                    exerciseData.fridayExercise2 ==
                                                        '' &&
                                                    exerciseData.fridayExercise3 ==
                                                        '' &&
                                                    exerciseData.fridayExercise4 ==
                                                        '' &&
                                                    exerciseData.fridayExercise5 ==
                                                        '' &&
                                                    exerciseData.fridayExercise6 ==
                                                        '' &&
                                                    exerciseData.fridayExercise7 ==
                                                        '' &&
                                                    exerciseData.fridayExercise8 ==
                                                        '' &&
                                                    exerciseData.fridayExercise9 ==
                                                        '' &&
                                                    exerciseData.fridayExercise10 ==
                                                        '' &&
                                                    exerciseData.fridayExercise11 ==
                                                        '' &&
                                                    exerciseData.fridayExercise12 ==
                                                        '' &&
                                                    exerciseData.fridayExercise13 ==
                                                        '' &&
                                                    exerciseData.fridayExercise14 ==
                                                        '' &&
                                                    exerciseData.fridayExercise15 ==
                                                        '' &&
                                                    exerciseData.fridayExercise16 ==
                                                        '') {
                                                  asyncConfirmDialog1(context);
                                                } else {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => Friday()),
                                                  );
                                                }
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
                              // Saturday -------------------------------------------------------
                              SizedBox(height: 20),
                              SizedBox(
                                width: 380,
                                child: Container(
                                  height: 150,
                                  child: Card(
                                    elevation: 2,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(height: 0),
                                        const ListTile(
                                          leading: Icon(Icons.calendar_today),
                                          title: Text('Saturday'),
                                          subtitle: Text('Routine'),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            const SizedBox(width: 72),
                                            Text('$saturday'),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                            FlatButton(
                                              child: const Icon(Icons.arrow_forward),
                                              onPressed: () {
                                                if (exerciseData.saturdayExercise1 == '' &&
                                                    exerciseData.saturdayExercise2 ==
                                                        '' &&
                                                    exerciseData.saturdayExercise3 ==
                                                        '' &&
                                                    exerciseData.saturdayExercise4 ==
                                                        '' &&
                                                    exerciseData.saturdayExercise5 ==
                                                        '' &&
                                                    exerciseData.saturdayExercise6 ==
                                                        '' &&
                                                    exerciseData.saturdayExercise7 ==
                                                        '' &&
                                                    exerciseData.saturdayExercise8 ==
                                                        '' &&
                                                    exerciseData.saturdayExercise9 ==
                                                        '' &&
                                                    exerciseData.saturdayExercise10 ==
                                                        '' &&
                                                    exerciseData.saturdayExercise11 ==
                                                        '' &&
                                                    exerciseData.saturdayExercise12 ==
                                                        '' &&
                                                    exerciseData.saturdayExercise13 ==
                                                        '' &&
                                                    exerciseData.saturdayExercise14 ==
                                                        '' &&
                                                    exerciseData.saturdayExercise15 ==
                                                        '' &&
                                                    exerciseData.saturdayExercise16 ==
                                                        '') {
                                                  asyncConfirmDialog1(context);
                                                } else {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => Saturday()),
                                                  );
                                                }
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
                              // Sunday -------------------------------------------------------
                              SizedBox(height: 20),
                              SizedBox(
                                width: 380,
                                child: Container(
                                  height: 150,
                                  child: Card(
                                    elevation: 2,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(height: 0),
                                        const ListTile(
                                          leading: Icon(Icons.calendar_today),
                                          title: Text('Sunday'),
                                          subtitle: Text('Routine'),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            const SizedBox(width: 72),
                                            Text('$sunday'),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: <Widget>[
                                            FlatButton(
                                              child: const Icon(Icons.arrow_forward),
                                              onPressed: () {
                                                if (exerciseData.sundayExercise1 == '' &&
                                                    exerciseData.sundayExercise2 ==
                                                        '' &&
                                                    exerciseData.sundayExercise3 ==
                                                        '' &&
                                                    exerciseData.sundayExercise4 ==
                                                        '' &&
                                                    exerciseData.sundayExercise5 ==
                                                        '' &&
                                                    exerciseData.sundayExercise6 ==
                                                        '' &&
                                                    exerciseData.sundayExercise7 ==
                                                        '' &&
                                                    exerciseData.sundayExercise8 ==
                                                        '' &&
                                                    exerciseData.sundayExercise9 ==
                                                        '' &&
                                                    exerciseData.sundayExercise10 ==
                                                        '' &&
                                                    exerciseData.sundayExercise11 ==
                                                        '' &&
                                                    exerciseData.sundayExercise12 ==
                                                        '' &&
                                                    exerciseData.sundayExercise13 ==
                                                        '' &&
                                                    exerciseData.sundayExercise14 ==
                                                        '' &&
                                                    exerciseData.sundayExercise15 ==
                                                        '' &&
                                                    exerciseData.sundayExercise16 ==
                                                        '') {
                                                  asyncConfirmDialog1(context);
                                                } else {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => Sunday()),
                                                  );
                                                }
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
                ));
          } else {
            return Loading();
          }
        });
  }
}
