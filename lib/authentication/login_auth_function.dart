import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_movie/utilities/constants.dart';

signup(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print(ErrorMessages.weakPassword);
    } else if (e.code == 'email-already-in-use') {
      print(ErrorMessages.emailAlreadyRegistered);
    }
  } catch (e) {
    print(e);
  }
}

signin(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print(ErrorMessages.invalidUser);
    } else if (e.code == 'wrong-password') {
      print(ErrorMessages.confirmPassword);
    }
  }
}