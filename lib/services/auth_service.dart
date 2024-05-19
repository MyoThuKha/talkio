import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final firebase = FirebaseAuth.instance;


  User? getUserData(){
    final result = firebase.currentUser;
    return result;
  }

  void login(String email, String password) async {
    final result = await firebase.signInWithEmailAndPassword(email: email, password: password);
    print(result.toString());
  }

  void logout()async{
    await firebase.signOut();
  }

}