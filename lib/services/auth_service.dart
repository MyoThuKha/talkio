import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:talkio/models/status.dart';

class AuthService {

  final firebase = FirebaseAuth.instance;

  User? getUserData(){
    final result = firebase.currentUser;
    return result;
  }

  Future<Status> login(String email, String password) async {
    try{
    final result = await firebase.signInWithEmailAndPassword(email: email, password: password);
      return Success();
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) print("------ ${e.code}");
      final message = authExceptionError(e.code);
      if (kDebugMode) print(message);
      return Failure();
    }
  }


  Future<Status> register(String email, String password) async {
    try{
    final result = await firebase.createUserWithEmailAndPassword(email: email, password: password);
      return Success();
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) print("------ ${e.code}");
      final message = authExceptionError(e.code);
      if (kDebugMode) print(message);
      return Failure();
    }
  }

  void logout()async{
    await firebase.signOut();
  }



  String authExceptionError(String errorCode) {
    switch (errorCode) {
      case "invalid-email":
        return "Please enter a valid mail address.";
      case "invalid-credential":
        return "Incorrect Password.";
      default:
        return "Sorry! Something went wrong. Please try again";
    }
  }

}