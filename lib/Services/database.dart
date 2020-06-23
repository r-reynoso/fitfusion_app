import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitfusionapp/Models/userInfo.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userInfo= Firestore.instance.collection('userlInfo');

  Future updateUserData(String firstName, String lastName, int age) async {
      return await userInfo.document(uid).setData({
        'firstName' : firstName,
        'lastName' : lastName,
        'age' : age,
      });
  }

  // user info list form snapshot
  List<Info> _infoListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Info(
        firstName: doc.data['firstName'] ?? '',
        lastName: doc.data['lastName'] ?? '',
        age: doc.data['age'] ?? '0'
      );
    }).toList();
  }

  // get user stream
  Stream<List<Info>> get user {
    return userInfo.snapshots()
        .map(_infoListFromSnapshot);
  }

}