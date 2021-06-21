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
      String mondayExercise11,
      String mondayExercise12,
      String mondayExercise13,
      String mondayExercise14,
      String mondayExercise15,
      String mondayExercise16,
      String tuesdayExercise1,
      String tuesdayExercise2,
      String tuesdayExercise3,
      String tuesdayExercise4,
      String tuesdayExercise5,
      String tuesdayExercise6,
      String tuesdayExercise7,
      String tuesdayExercise8,
      String tuesdayExercise9,
      String tuesdayExercise10,
      String tuesdayExercise11,
      String tuesdayExercise12,
      String tuesdayExercise13,
      String tuesdayExercise14,
      String tuesdayExercise15,
      String tuesdayExercise16,
      String wednesdayExercise1,
      String wednesdayExercise2,
      String wednesdayExercise3,
      String wednesdayExercise4,
      String wednesdayExercise5,
      String wednesdayExercise6,
      String wednesdayExercise7,
      String wednesdayExercise8,
      String wednesdayExercise9,
      String wednesdayExercise10,
      String wednesdayExercise11,
      String wednesdayExercise12,
      String wednesdayExercise13,
      String wednesdayExercise14,
      String wednesdayExercise15,
      String wednesdayExercise16,
      String thursdayExercise1,
      String thursdayExercise2,
      String thursdayExercise3,
      String thursdayExercise4,
      String thursdayExercise5,
      String thursdayExercise6,
      String thursdayExercise7,
      String thursdayExercise8,
      String thursdayExercise9,
      String thursdayExercise10,
      String thursdayExercise11,
      String thursdayExercise12,
      String thursdayExercise13,
      String thursdayExercise14,
      String thursdayExercise15,
      String thursdayExercise16,
      String fridayExercise1,
      String fridayExercise2,
      String fridayExercise3,
      String fridayExercise4,
      String fridayExercise5,
      String fridayExercise6,
      String fridayExercise7,
      String fridayExercise8,
      String fridayExercise9,
      String fridayExercise10,
      String fridayExercise11,
      String fridayExercise12,
      String fridayExercise13,
      String fridayExercise14,
      String fridayExercise15,
      String fridayExercise16,
      String saturdayExercise1,
      String saturdayExercise2,
      String saturdayExercise3,
      String saturdayExercise4,
      String saturdayExercise5,
      String saturdayExercise6,
      String saturdayExercise7,
      String saturdayExercise8,
      String saturdayExercise9,
      String saturdayExercise10,
      String saturdayExercise11,
      String saturdayExercise12,
      String saturdayExercise13,
      String saturdayExercise14,
      String saturdayExercise15,
      String saturdayExercise16,
      String sundayExercise1,
      String sundayExercise2,
      String sundayExercise3,
      String sundayExercise4,
      String sundayExercise5,
      String sundayExercise6,
      String sundayExercise7,
      String sundayExercise8,
      String sundayExercise9,
      String sundayExercise10,
      String sundayExercise11,
      String sundayExercise12,
      String sundayExercise13,
      String sundayExercise14,
      String sundayExercise15,
      String sundayExercise16) async {
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
      'mondayExercise11': mondayExercise11,
      'mondayExercise12': mondayExercise12,
      'mondayExercise13': mondayExercise13,
      'mondayExercise14': mondayExercise14,
      'mondayExercise15': mondayExercise15,
      'mondayExercise16': mondayExercise16,
      'tuesdayExercise1': tuesdayExercise1,
      'tuesdayExercise2': tuesdayExercise2,
      'tuesdayExercise3': tuesdayExercise3,
      'tuesdayExercise4': tuesdayExercise4,
      'tuesdayExercise5': tuesdayExercise5,
      'tuesdayExercise6': tuesdayExercise6,
      'tuesdayExercise7': tuesdayExercise7,
      'tuesdayExercise8': tuesdayExercise8,
      'tuesdayExercise9': tuesdayExercise9,
      'tuesdayExercise10': tuesdayExercise10,
      'tuesdayExercise11': tuesdayExercise11,
      'tuesdayExercise12': tuesdayExercise12,
      'tuesdayExercise13': tuesdayExercise13,
      'tuesdayExercise14': tuesdayExercise14,
      'tuesdayExercise15': tuesdayExercise15,
      'tuesdayExercise16': tuesdayExercise16,
      'wednesdayExercise1': wednesdayExercise1,
      'wednesdayExercise2': wednesdayExercise2,
      'wednesdayExercise3': wednesdayExercise3,
      'wednesdayExercise4': wednesdayExercise4,
      'wednesdayExercise5': wednesdayExercise5,
      'wednesdayExercise6': wednesdayExercise6,
      'wednesdayExercise7': wednesdayExercise7,
      'wednesdayExercise8': wednesdayExercise8,
      'wednesdayExercise9': wednesdayExercise9,
      'wednesdayExercise10': wednesdayExercise10,
      'wednesdayExercise11': wednesdayExercise11,
      'wednesdayExercise12': wednesdayExercise12,
      'wednesdayExercise13': wednesdayExercise13,
      'wednesdayExercise14': wednesdayExercise14,
      'wednesdayExercise15': wednesdayExercise15,
      'wednesdayExercise16': wednesdayExercise16,
      'thursdayExercise1': thursdayExercise1,
      'thursdayExercise2': thursdayExercise2,
      'thursdayExercise3': thursdayExercise3,
      'thursdayExercise4': thursdayExercise4,
      'thursdayExercise5': thursdayExercise5,
      'thursdayExercise6': thursdayExercise6,
      'thursdayExercise7': thursdayExercise7,
      'thursdayExercise8': thursdayExercise8,
      'thursdayExercise9': thursdayExercise9,
      'thursdayExercise10': thursdayExercise10,
      'thursdayExercise11': thursdayExercise11,
      'thursdayExercise12': thursdayExercise12,
      'thursdayExercise13': thursdayExercise13,
      'thursdayExercise14': thursdayExercise14,
      'thursdayExercise15': thursdayExercise15,
      'thursdayExercise16': thursdayExercise16,
      'fridayExercise1': fridayExercise1,
      'fridayExercise2': fridayExercise2,
      'fridayExercise3': fridayExercise3,
      'fridayExercise4': fridayExercise4,
      'fridayExercise5': fridayExercise5,
      'fridayExercise6': fridayExercise6,
      'fridayExercise7': fridayExercise7,
      'fridayExercise8': fridayExercise8,
      'fridayExercise9': fridayExercise9,
      'fridayExercise10': fridayExercise10,
      'fridayExercise11': fridayExercise11,
      'fridayExercise12': fridayExercise12,
      'fridayExercise13': fridayExercise13,
      'fridayExercise14': fridayExercise14,
      'fridayExercise15': fridayExercise15,
      'fridayExercise16': fridayExercise16,
      'saturdayExercise1': saturdayExercise1,
      'saturdayExercise2': saturdayExercise2,
      'saturdayExercise3': saturdayExercise3,
      'saturdayExercise4': saturdayExercise4,
      'saturdayExercise5': saturdayExercise5,
      'saturdayExercise6': saturdayExercise6,
      'saturdayExercise7': saturdayExercise7,
      'saturdayExercise8': saturdayExercise8,
      'saturdayExercise9': saturdayExercise9,
      'saturdayExercise10': saturdayExercise10,
      'saturdayExercise11': saturdayExercise11,
      'saturdayExercise12': saturdayExercise12,
      'saturdayExercise13': saturdayExercise13,
      'saturdayExercise14': saturdayExercise14,
      'saturdayExercise15': saturdayExercise15,
      'saturdayExercise16': saturdayExercise16,
      'sundayExercise1': sundayExercise1,
      'sundayExercise2': sundayExercise2,
      'sundayExercise3': sundayExercise3,
      'sundayExercise4': sundayExercise4,
      'sundayExercise5': sundayExercise5,
      'sundayExercise6': sundayExercise6,
      'sundayExercise7': sundayExercise7,
      'sundayExercise8': sundayExercise8,
      'sundayExercise9': sundayExercise9,
      'sundayExercise10': sundayExercise10,
      'sundayExercise11': sundayExercise11,
      'sundayExercise12': sundayExercise12,
      'sundayExercise13': sundayExercise13,
      'sundayExercise14': sundayExercise14,
      'sundayExercise15': sundayExercise15,
      'sundayExercise16': sundayExercise16,
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

  // userData from snapshot
  DietData _dietDataFromSnapshot(DocumentSnapshot snapshot) {
    return DietData(
      uid: uid,
      mondayDiet: snapshot.data['mondayDiet'],
      tuesdayDiet: snapshot.data['tuesdayDiet'],
      wednesdayDiet: snapshot.data['wednesdayDiet'],
      thursdayDiet: snapshot.data['thursdayDiet'],
      fridayDiet: snapshot.data['fridayDiet'],
      saturdayDiet: snapshot.data['saturdayDiet'],
      sundayDiet: snapshot.data['sundayDiet'],
    );
  }

  // exerciseData from snapshot
  ExerciseData _exerciseDataFromSnapshot(DocumentSnapshot snapshot) {
    return ExerciseData(
      uid: uid,
      fridayExercise1: snapshot.data['fridayExercise1'],
      fridayExercise2: snapshot.data['fridayExercise2'],
      fridayExercise3: snapshot.data['fridayExercise3'],
      fridayExercise4: snapshot.data['fridayExercise4'],
      fridayExercise5: snapshot.data['fridayExercise5'],
      fridayExercise6: snapshot.data['fridayExercise6'],
      fridayExercise7: snapshot.data['fridayExercise7'],
      fridayExercise8: snapshot.data['fridayExercise8'],
      fridayExercise9: snapshot.data['fridayExercise9'],
      fridayExercise10: snapshot.data['fridayExercise10'],
      fridayExercise11: snapshot.data['fridayExercise11'],
      fridayExercise12: snapshot.data['fridayExercise12'],
      fridayExercise13: snapshot.data['fridayExercise13'],
      fridayExercise14: snapshot.data['fridayExercise14'],
      fridayExercise15: snapshot.data['fridayExercise15'],
      fridayExercise16: snapshot.data['fridayExercise16'],
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
      mondayExercise11: snapshot.data['mondayExercise11'],
      mondayExercise12: snapshot.data['mondayExercise12'],
      mondayExercise13: snapshot.data['mondayExercise13'],
      mondayExercise14: snapshot.data['mondayExercise14'],
      mondayExercise15: snapshot.data['mondayExercise15'],
      mondayExercise16: snapshot.data['mondayExercise16'],
      saturdayExercise1: snapshot.data['saturdayExercise1'],
      saturdayExercise2: snapshot.data['saturdayExercise2'],
      saturdayExercise3: snapshot.data['saturdayExercise3'],
      saturdayExercise4: snapshot.data['saturdayExercise4'],
      saturdayExercise5: snapshot.data['saturdayExercise5'],
      saturdayExercise6: snapshot.data['saturdayExercise6'],
      saturdayExercise7: snapshot.data['saturdayExercise7'],
      saturdayExercise8: snapshot.data['saturdayExercise8'],
      saturdayExercise9: snapshot.data['saturdayExercise9'],
      saturdayExercise10: snapshot.data['saturdayExercise10'],
      saturdayExercise11: snapshot.data['saturdayExercise11'],
      saturdayExercise12: snapshot.data['saturdayExercise12'],
      saturdayExercise13: snapshot.data['saturdayExercise13'],
      saturdayExercise14: snapshot.data['saturdayExercise14'],
      saturdayExercise15: snapshot.data['saturdayExercise15'],
      saturdayExercise16: snapshot.data['saturdayExercise16'],
      sundayExercise1: snapshot.data['sundayExercise1'],
      sundayExercise2: snapshot.data['sundayExercise2'],
      sundayExercise3: snapshot.data['sundayExercise3'],
      sundayExercise4: snapshot.data['sundayExercise4'],
      sundayExercise5: snapshot.data['sundayExercise5'],
      sundayExercise6: snapshot.data['sundayExercise6'],
      sundayExercise7: snapshot.data['sundayExercise7'],
      sundayExercise8: snapshot.data['sundayExercise8'],
      sundayExercise9: snapshot.data['sundayExercise9'],
      sundayExercise10: snapshot.data['sundayExercise10'],
      sundayExercise11: snapshot.data['sundayExercise11'],
      sundayExercise12: snapshot.data['sundayExercise12'],
      sundayExercise13: snapshot.data['sundayExercise13'],
      sundayExercise14: snapshot.data['sundayExercise14'],
      sundayExercise15: snapshot.data['sundayExercise15'],
      sundayExercise16: snapshot.data['sundayExercise16'],
      thursdayExercise1: snapshot.data['thursdayExercise1'],
      thursdayExercise2: snapshot.data['thursdayExercise2'],
      thursdayExercise3: snapshot.data['thursdayExercise3'],
      thursdayExercise4: snapshot.data['thursdayExercise4'],
      thursdayExercise5: snapshot.data['thursdayExercise5'],
      thursdayExercise6: snapshot.data['thursdayExercise6'],
      thursdayExercise7: snapshot.data['thursdayExercise7'],
      thursdayExercise8: snapshot.data['thursdayExercise8'],
      thursdayExercise9: snapshot.data['thursdayExercise9'],
      thursdayExercise10: snapshot.data['thursdayExercise10'],
      thursdayExercise11: snapshot.data['thursdayExercise11'],
      thursdayExercise12: snapshot.data['thursdayExercise12'],
      thursdayExercise13: snapshot.data['thursdayExercise13'],
      thursdayExercise14: snapshot.data['thursdayExercise14'],
      thursdayExercise15: snapshot.data['thursdayExercise15'],
      thursdayExercise16: snapshot.data['thursdayExercise16'],
      tuesdayExercise1: snapshot.data['tuesdayExercise1'],
      tuesdayExercise2: snapshot.data['tuesdayExercise2'],
      tuesdayExercise3: snapshot.data['tuesdayExercise3'],
      tuesdayExercise4: snapshot.data['tuesdayExercise4'],
      tuesdayExercise5: snapshot.data['tuesdayExercise5'],
      tuesdayExercise6: snapshot.data['tuesdayExercise6'],
      tuesdayExercise7: snapshot.data['tuesdayExercise7'],
      tuesdayExercise8: snapshot.data['tuesdayExercise8'],
      tuesdayExercise9: snapshot.data['tuesdayExercise9'],
      tuesdayExercise10: snapshot.data['tuesdayExercise10'],
      tuesdayExercise11: snapshot.data['tuesdayExercise11'],
      tuesdayExercise12: snapshot.data['tuesdayExercise12'],
      tuesdayExercise13: snapshot.data['tuesdayExercise13'],
      tuesdayExercise14: snapshot.data['tuesdayExercise14'],
      tuesdayExercise15: snapshot.data['tuesdayExercise15'],
      tuesdayExercise16: snapshot.data['tuesdayExercise16'],
      wednesdayExercise1: snapshot.data['wednesdayExercise1'],
      wednesdayExercise2: snapshot.data['wednesdayExercise2'],
      wednesdayExercise3: snapshot.data['wednesdayExercise3'],
      wednesdayExercise4: snapshot.data['wednesdayExercise4'],
      wednesdayExercise5: snapshot.data['wednesdayExercise5'],
      wednesdayExercise6: snapshot.data['wednesdayExercise6'],
      wednesdayExercise7: snapshot.data['wednesdayExercise7'],
      wednesdayExercise8: snapshot.data['wednesdayExercise8'],
      wednesdayExercise9: snapshot.data['wednesdayExercise9'],
      wednesdayExercise10: snapshot.data['wednesdayExercise10'],
      wednesdayExercise11: snapshot.data['wednesdayExercise11'],
      wednesdayExercise12: snapshot.data['wednesdayExercise12'],
      wednesdayExercise13: snapshot.data['wednesdayExercise13'],
      wednesdayExercise14: snapshot.data['wednesdayExercise14'],
      wednesdayExercise15: snapshot.data['wednesdayExercise15'],
      wednesdayExercise16: snapshot.data['wednesdayExercise16'],
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

  // get user doc stream
  Stream<DietData> get dietData {
    return userDiet.document(uid).snapshots().map(_dietDataFromSnapshot);
  }
}
