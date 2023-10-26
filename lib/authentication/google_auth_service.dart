import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../movie_db/movie_homepage.dart';


class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> handleGoogleSignIn(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );


      final UserCredential authResult = await FirebaseAuth.instance
          .signInWithCredential(credential);
      final User? user = authResult.user;

      if (user != null) {
        // Authentication successful, navigate to MovieHomepage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MovieHomepage(),
          ),
        );
      }
    }

    signOut() async {
      await _auth.signOut();
      await _googleSignIn.signOut();
    }
  }
}

