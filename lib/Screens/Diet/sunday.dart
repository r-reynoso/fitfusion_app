import 'package:fitfusionapp/Models/user.dart';
import 'package:fitfusionapp/Shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitfusionapp/Services/database.dart';
import 'package:provider/provider.dart';

class SundayDiet extends StatefulWidget {
  @override
  _SundayDietState createState() => _SundayDietState();
}

class _SundayDietState extends State<SundayDiet> {
  double size = 20.0;

  @override
  Widget build(BuildContext context) {
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
                    elevation: 0.0,
                  ),
                  body: Center(
                      child: Align(
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              // Sunday -------------------------------------------------------
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
                                          SizedBox(height: 20),
                                          const ListTile(
                                            leading: Icon(Icons.calendar_today),
                                            title: Text('Sunday'),
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
                                            title: Text('Diet'),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(70, 20, 70, 20),
                                            child: Text(dietData.sundayDiet,
                                                textAlign: TextAlign.justify,
                                                overflow: TextOverflow.visible,
                                                style: TextStyle(fontSize: 20, height: 1.5),
                                            ),
                                          )
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
