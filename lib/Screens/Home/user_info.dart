import 'package:fitfusionapp/Models/user.dart';
import 'package:fitfusionapp/Services/database.dart';
import 'package:fitfusionapp/Shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitfusionapp/Models/userInfo.dart';
import 'package:fitfusionapp/Screens/Home/info_tile.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return InfoTile();
          } else {
            return Loading();
          }
        });
  }
// Widget build(BuildContext context) {
//   final info = Provider.of<List<Info>>(context) ?? [];
//
//   return ListView.builder(
//     itemCount: info.length,
//     itemBuilder: (context, index) {
//       return InfoTile(info: info[index]);
//     },
//   );
// }
}
