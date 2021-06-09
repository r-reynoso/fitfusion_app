import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitfusionapp/Models/exercise.dart';
import 'package:fitfusionapp/Models/exerciseInfo.dart';
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

  Future updateUserInfo(
      String email,
      String firstName,
      String lastName,
      String gender,
      int age,
      int weight,
      int feet,
      int inches) async {
    return await userInfo.document(uid).setData({
      'email': email,
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
      String mondayExercise1,
      String mondayExercise2,
      String mondayExercise3,
      String mondayExercise4,
      String mondayExercise5,
      String mondayExercise6,
      String mondayExercise7,
      String mondayExercise8,
      String mondayExercise9,
      String mondayExercise10,
      String tuesdayExercise,
      String wednesdayExercise,
      String thursdayExercise,
      String fridayExercise,
      String saturdayExercise,
      String sundayExercise) async {
    return await userExercise.document(uid).setData({
      'mondayExercise1': mondayExercise1,
      'mondayExercise2': mondayExercise2,
      'mondayExercise3': mondayExercise3,
      'mondayExercise4': mondayExercise4,
      'mondayExercise5': mondayExercise5,
      'mondayExercise6': mondayExercise6,
      'mondayExercise7': mondayExercise7,
      'mondayExercise8': mondayExercise8,
      'mondayExercise9': mondayExercise9,
      'mondayExercise10': mondayExercise10,
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
      email: snapshot.data['email'],
      firstName: snapshot.data['firstName'],
      lastName: snapshot.data['lastName'],
      age: snapshot.data['age'],
      gender: snapshot.data['gender'],
      weight: snapshot.data['weight'],
      feet: snapshot.data['feet'],
      inches: snapshot.data['inches'],
    );
  }

  // exerciseData from snapshot
  ExerciseData _exerciseDataFromSnapshot(DocumentSnapshot snapshot) {
    return ExerciseData(
      uid: uid,
      fridayExercise: snapshot.data['fridayExercise'],
      mondayExercise1: snapshot.data['mondayExercise1'],
      mondayExercise2: snapshot.data['mondayExercise2'],
      mondayExercise3: snapshot.data['mondayExercise3'],
      mondayExercise4: snapshot.data['mondayExercise4'],
      mondayExercise5: snapshot.data['mondayExercise5'],
      mondayExercise6: snapshot.data['mondayExercise6'],
      mondayExercise7: snapshot.data['mondayExercise7'],
      mondayExercise8: snapshot.data['mondayExercise8'],
      mondayExercise9: snapshot.data['mondayExercise9'],
      mondayExercise10: snapshot.data['mondayExercise10'],
      saturdayExercise: snapshot.data['saturdayExercise'],
      sundayExercise: snapshot.data['sundayExercise'],
      thursdayExercise: snapshot.data['thursdayExercise'],
      tuesdayExercise: snapshot.data['tuesdayExercise'],
      wednesdayExercise: snapshot.data['wednesdayExercise'],
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

  // get user doc stream
  Stream<ExerciseData> get exerciseData {
    return userExercise.document(uid).snapshots().map(_exerciseDataFromSnapshot);
  }
}
