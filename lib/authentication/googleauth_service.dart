import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_movie/moviedb/moviehomepage.dart';

class Auth_service {
  Future<User?> signInWithGoogle(BuildContext context) async {
    try {
      // Interactive sign-in
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      if (gUser == null) {
        // User canceled the sign-in process
        return null;
      }

      // Obtain auth details from the request
      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      // Create new credential for the user
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // Final sign-in with Firebase
      final UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Check if the user is signed in successfully
      if (userCredential.user != null) {
        // Navigate to the movie homepage
        //Replace the current route once it has finished animating in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => movie_Homepage(),
          ),
        );
        return userCredential.user;
      }

      return null;
    } catch (e) {
      // Handle any errors here
      print("Error signing in with Google: $e");
      return null;
    }
  }
}