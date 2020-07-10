import 'package:flutter/material.dart';
import 'package:fitfusionapp/Models/userInfo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';

class InfoTile extends StatefulWidget {
  final Info info;

  InfoTile({this.info});

  @override
  _InfoTileState createState() => _InfoTileState();
}

class _InfoTileState extends State<InfoTile> {
  File _image;
  final _picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickedFile.path);
      print('Image Path $_image');
    });
  }

  Future uploadPic(BuildContext context) async {
    String fileName = basename(_image.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    setState(() {
      print("Profile picture uploaded.");
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Profile picture uploaded.')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        SizedBox(height: 50),
        Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            radius: 85,
            backgroundColor: Colors.black,
            child: ClipOval(
              child: SizedBox(
                  width: 150.0,
                  height: 150.0,
                  child: (_image != null)
                      ? Image.file(_image, fit: BoxFit.cover)
                      : Image.asset('assets/images/logoSmallWhite.png',
                          fit: BoxFit.fill)),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 0),
          child: IconButton(
            icon: Icon(FontAwesomeIcons.camera,
                size: 20, color: Colors.deepOrange),
            onPressed: () {
              getImage();
              uploadPic(context);
            },
          ),
        ),
        SizedBox(height: 20.0),
        Padding(
          padding: EdgeInsets.only(top: 0),
          child: IconButton(
            icon:
                Icon(FontAwesomeIcons.save, size: 20, color: Colors.deepOrange),
            onPressed: () {
              uploadPic(context);
            },
          ),
        ),
        SizedBox(height: 20.0),
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    'Name:',
                    style: TextStyle(
                        fontSize: 30.0, fontWeight: FontWeight.normal),
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
                    widget.info.firstName,
                    style: TextStyle(
                        fontSize: 30.0, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    widget.info.lastName,
                    style: TextStyle(
                        fontSize: 30.0, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    'Age:',
                    style: TextStyle(
                        fontSize: 30.0, fontWeight: FontWeight.normal),
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
                    '${widget.info.age}',
                    style: TextStyle(
                        fontSize: 30.0, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    'Weight:',
                    style: TextStyle(
                        fontSize: 30.0, fontWeight: FontWeight.normal),
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
                    '${widget.info.weight} lbs',
                    style: TextStyle(
                        fontSize: 30.0, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text(
                    'Height:',
                    style: TextStyle(
                        fontSize: 30.0, fontWeight: FontWeight.normal),
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
                    '${widget.info.feet} feet  ${widget.info.inches} inches',
                    style: TextStyle(
                        fontSize: 30.0, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}

//@override
//Widget build(BuildContext context) {
//  return Padding(
//    padding: EdgeInsets.only(top: 10.0),
//    child: Card(
//        margin: EdgeInsets.all(10),
//        child: ListTile(
//          leading: CircleAvatar(
//            radius: 25.0,
//            backgroundColor: Colors.grey,
//            backgroundImage: AssetImage('assets/images/logoSmall.png'),
//          ),
//          title: Text(info.firstName),
//         subtitle: Text('Takes ${info.age} age(a)'),
//        )
//    ),
//  );
//}
//}
