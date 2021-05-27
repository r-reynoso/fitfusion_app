import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitfusionapp/Models/userInfo.dart';
import 'package:fitfusionapp/Models/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // collection reference
  final CollectionReference userInfo =
      Firestore.instance.collection('userInfo');

  final CollectionReference userExercise =
      Firestore.instance.collection('userExercise');

  final CollectionReference userDiet =
      Firestore.instance.collection('userDiet');

  Future updateUserInfo(String firstName, String lastName, String gender,
      int age, int weight, int feet, int inches) async {
    return await userInfo.document(uid).setData({
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'age': age,
      'weight': weight,
      'feet': feet,
      'inches': inches,
    });
  }

  Future updateUserExercise(
      String mondayExercise,
      String tuesdayExercise,
      String wednesdayExercise,
      String thursdayExercise,
      String fridayExercise,
      String saturdayExercise,
      String sundayExercise) async {
    return await userExercise.document(uid).setData({
      'mondayExercise': mondayExercise,
      'tuesdayExercise': tuesdayExercise,
      'wednesdayExercise': wednesdayExercise,
      'thursdayExercise': thursdayExercise,
      'fridayExercise': fridayExercise,
      'saturdayExercise': saturdayExercise,
      'sundayExercise': sundayExercise,
    });
  }

  Future updateUserDiet(
      String mondayDiet,
      String tuesdayDiet,
      String wednesdayDiet,
      String thursdayDiet,
      String fridayDiet,
      String saturdayDiet,
      String sundayDiet) async {
    return await userDiet.document(uid).setData({
      'mondayDiet': mondayDiet,
      'tuesdayDiet': tuesdayDiet,
      'wednesdayDiet': wednesdayDiet,
      'thursdayDiet': thursdayDiet,
      'fridayDiet': fridayDiet,
      'saturdayDiet': saturdayDiet,
      'sundayDiet': sundayDiet,
    });
  }

  // user info list form snapshot
  List<Info> _infoListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Info(
          firstName: doc.data['firstName'] ?? '',
          lastName: doc.data['lastName'] ?? '',
          gender: doc.data['gender'] ?? '',
          age: doc.data['age'] ?? '0',
          weight: doc.data['weight'] ?? '0',
          feet: doc.data['feet'] ?? '0',
          inches: doc.data['inches'] ?? '0');
    }).toList();
  }

  // userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      firstName: snapshot.data['firstName'],
      lastName: snapshot.data['lastName'],
      age: snapshot.data['age'],
      gender: snapshot.data['gender'],
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
