import 'package:flutter/material.dart';
import 'package:fitfusionapp/Models/userInfo.dart';

class InfoTile extends StatelessWidget {

  final Info info;
  InfoTile({this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage('assets/images/logoSmall.png'),
          ),
          title: Text(info.firstName),
          subtitle: Text('Takes ${info.age} age(a)'),
        )
      ),
    );
  }
}

