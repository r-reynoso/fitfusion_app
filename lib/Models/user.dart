class User {
  final String uid;

  User({this.uid});
}

class UserData {
  final String uid;
  final String firstName;
  final String lastName;
  final String gender;
  final int age;
  final int weight;
  final int feet;
  final int inches;

  UserData(
      {this.uid,
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
  final String mondayExercise;
  final String saturdayExercise;
  final String sundayExercise;
  final String thursdayExercise;
  final String tuesdayExercise;
  final String wednesdayExercise;


  ExerciseData(
      {this.uid,
        this.fridayExercise,
        this.mondayExercise,
        this.saturdayExercise,
        this.sundayExercise,
        this.thursdayExercise,
        this.tuesdayExercise,
        this.wednesdayExercise});
}
