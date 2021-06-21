import 'package:fitfusionapp/Models/user.dart';
import 'package:fitfusionapp/Screens/Diet/saturday.dart';
import 'package:fitfusionapp/Screens/Diet/sunday.dart';
import 'package:fitfusionapp/Screens/Diet/thursday.dart';
import 'package:fitfusionapp/Screens/Diet/tuesday.dart';
import 'package:fitfusionapp/Screens/Diet/wednesday.dart';
import 'package:fitfusionapp/Shared/constants.dart';
import 'package:fitfusionapp/Shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:fitfusionapp/Services/database.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'friday.dart';
import 'monday.dart';

class DaysDiet extends StatefulWidget {
  @override
  _DaysDietState createState() => _DaysDietState();
}

class _DaysDietState extends State<DaysDiet> {
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

    return StreamBuilder<DietData>(
        stream: DatabaseService(uid: user.uid).dietData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            DietData dietData = snapshot.data;
            return Container(
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    iconTheme: IconThemeData(
                      color: Color.fromARGB(255, 47, 150, 153),
                    ),
                    backgroundColor: Colors.black,
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
                                    elevation: 0,
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
                                          title: Text('Diet Program By Days'),
                                          subtitle: Text(
                                              'Select which day is your diet program today.'),
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
                                    elevation: 5,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(height: 0),
                                        const ListTile(
                                          leading: Icon(Icons.calendar_today),
                                          title: Text('Monday'),
                                          subtitle: Text('Diet'),
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
                                                if (dietData.mondayDiet == '') {
                                                  asyncConfirmDialog2(context);
                                                } else {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => MondayDiet()),
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
                                    elevation: 5,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(height: 0),
                                        const ListTile(
                                          leading: Icon(Icons.calendar_today),
                                          title: Text('Tuesday'),
                                          subtitle: Text('Diet'),
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
                                                if (dietData.tuesdayDiet == '') {
                                                  asyncConfirmDialog2(context);
                                                } else {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => TuesdayDiet()),
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
                                    elevation: 5,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(height: 0),
                                        const ListTile(
                                          leading: Icon(Icons.calendar_today),
                                          title: Text('Wednesday'),
                                          subtitle: Text('Diet'),
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
                                                if (dietData.wednesdayDiet == '') {
                                                  asyncConfirmDialog2(context);
                                                } else {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => WednesdayDiet()),
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
                                    elevation: 5,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(height: 0),
                                        const ListTile(
                                          leading: Icon(Icons.calendar_today),
                                          title: Text('Thursday'),
                                          subtitle: Text('Diet'),
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
                                                if (dietData.thursdayDiet == '') {
                                                  asyncConfirmDialog2(context);
                                                } else {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => ThursdayDiet()),
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
                                    elevation: 5,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(height: 0),
                                        const ListTile(
                                          leading: Icon(Icons.calendar_today),
                                          title: Text('Friday'),
                                          subtitle: Text('Diet'),
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
                                                if (dietData.fridayDiet == '') {
                                                  asyncConfirmDialog2(context);
                                                } else {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => FridayDiet()),
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
                                    elevation: 5,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(height: 0),
                                        const ListTile(
                                          leading: Icon(Icons.calendar_today),
                                          title: Text('Saturday'),
                                          subtitle: Text('Diet'),
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
                                                if (dietData.saturdayDiet == '') {
                                                  asyncConfirmDialog2(context);
                                                } else {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => SaturdayDiet()),
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
                                    elevation: 5,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SizedBox(height: 0),
                                        const ListTile(
                                          leading: Icon(Icons.calendar_today),
                                          title: Text('Sunday'),
                                          subtitle: Text('Diet'),
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
                                                if (dietData.sundayDiet == '') {
                                                  asyncConfirmDialog2(context);
                                                } else {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => SundayDiet()),
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
