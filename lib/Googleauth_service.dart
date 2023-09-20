import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth_service{

  signInWithGoogle() async {
    //interactive sig in
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    //obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    //create new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    //final sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}