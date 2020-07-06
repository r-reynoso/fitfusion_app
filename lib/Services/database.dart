import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitfusionapp/Models/userInfo.dart';
import 'package:fitfusionapp/Models/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userInfo =
      Firestore.instance.collection('userInfo');

  Future updateUserData(String firstName, String lastName, int age, int weight,
      int feet, int inches) async {
    return await userInfo.document(uid).setData({
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'weight': weight,
      'feet': feet,
      'inches': inches,
    });
  }

  // user info list form snapshot
  List<Info> _infoListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Info(
          firstName: doc.data['firstName'] ?? '',
          lastName: doc.data['lastName'] ?? '',
          age: doc.data['age'] ?? '0');
    }).toList();
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      firstName: snapshot.data['firstName'],
      lastName: snapshot.data['lastName'],
      age: snapshot.data['age'],
      weight: snapshot.data['weight'],
      feet: snapshot.data['feet'],
      inches: snapshot.data['inches'],
    );
  }

  // get user stream
  Stream<List<Info>> get user {
    return userInfo.snapshots().map(_infoListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userInfo.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
