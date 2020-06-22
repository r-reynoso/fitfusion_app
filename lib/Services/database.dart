import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid});

  // collection reference
  final CollectionReference userInfo= Firestore.instance.collection('userlInfo');

  Future updateUserData(String firstName, String lastName, int age) async {
      return await userInfo.document(uid).setData({
        'firstName' : firstName,
        'lastName' : lastName,
        'age' : age,
      });
  }

}