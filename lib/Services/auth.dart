import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitfusionapp/Models/user.dart';
import 'package:fitfusionapp/Services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _results = '';

  // create user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      _results = e.code;
      print(_results);
      switch (_results) {
        case "ERROR_WRONG_PASSWORD":
          _results = "Email or Password is incorrect. Please try again.";
          break;
        case "ERROR_INVALID_EMAIL":
          _results = "Invalid email. Please try again.";
          break;
        case "ERROR_USER_NOT_FOUND":
          _results = "No user found with this email. Try register.";
          break;
        case "ERROR_USER_DISABLED":
          _results =
              "The account with which the email is associated has been disabled.";
          break;
        default:
          _results = "An undefined Error happened.";
      }

      print(_results);
      return _results;
    }
  }

  //register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid)
          .updateUserData('', '', 'Male', 0, 0, 0, 0);
      await DatabaseService(uid: user.uid)
          .updateUserExercise('', '', '', '', '', '', '');
      await DatabaseService(uid: user.uid)
          .updateUserDiet('', '', '', '', '', '', '');
      return _userFromFirebaseUser(user);
    } catch (e) {
      _results = e.code;
      print(_results);
      switch (_results) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
          _results = "The email address is already in use by another account.";
          break;
        case "ERROR_INVALID_EMAIL":
          _results = "Invalid Email. Please try again.";
          break;
        default:
          _results = "An undefined Error happened.";
      }

      print(_results);
      return _results;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
