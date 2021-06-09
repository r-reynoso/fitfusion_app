class User {
  final String uid;

  User({this.uid});
}

class UserData {
  final String uid;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final int age;
  final int weight;
  final int feet;
  final int inches;

  UserData(
      {this.uid,
      this.email,
      this.firstName,
      this.lastName,
      this.gender,
      this.age,
      this.weight,
      this.feet,
      this.inches});
}

class ExerciseData {
  final String uid;
  final String fridayExercise;
  final String mondayExercise1;
  final String mondayExercise2;
  final String mondayExercise3;
  final String mondayExercise4;
  final String mondayExercise5;
  final String mondayExercise6;
  final String mondayExercise7;
  final String mondayExercise8;
  final String mondayExercise9;
  final String mondayExercise10;
  final String saturdayExercise;
  final String sundayExercise;
  final String thursdayExercise;
  final String tuesdayExercise;
  final String wednesdayExercise;


  ExerciseData(
      {this.uid,
        this.fridayExercise,
        this.mondayExercise1,
        this.mondayExercise2,
        this.mondayExercise3,
        this.mondayExercise4,
        this.mondayExercise5,
        this.mondayExercise6,
        this.mondayExercise7,
        this.mondayExercise8,
        this.mondayExercise9,
        this.mondayExercise10,
        this.saturdayExercise,
        this.sundayExercise,
        this.thursdayExercise,
        this.tuesdayExercise,
        this.wednesdayExercise});
}
