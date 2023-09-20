import 'package:flutter/material.dart';
import 'package:my_movie/Registeration_Page/background_Animation.dart';
import 'package:my_movie/Movie_db/movie_homepage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_movie/Googleauth_service.dart';

class register_main extends StatelessWidget {
  const register_main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //BackgroundAnimation(),
          Positioned.fill(
            child: BackgroundAnimation(),
          ),

          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Column(
              children: <Widget>[
                // ElevatedButton(
                //     onPressed: (){},
                //     child: Column(
                //       //crossAxisAlignment: CrossAxisAlignment.stretch,
                //       //crossAxisAlignment: CrossAxisAlignment.stretch,
                //
                //       children:<Widget>[
                GestureDetector(
                  onTap: () => Auth_service().signInWithGoogle(),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'SIGN IN WITH GOOGLE',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 8),
                      Image(
                        image: AssetImage('images/google.png'),
                      ),
                    ],
                  ),
                ),
                //SizedBox(height: 10),
                // ElevatedButton(
                //     onPressed: (){},
                //     child: Column(
                //       children:<Widget>[
                GestureDetector(
                  onTap: () => Auth_service().signInWithGoogle(),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'SIGN UP WITH EMAIL',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                      SizedBox(height: 15),
                      Image(
                        image: AssetImage('images/gmail.png'),
                      ),
                    ],
                  ),
                ),
                //SizedBox(height: 10),
                Container(
                  child: Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      backgroundColor: Colors.white,
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional.center,
            child: ElevatedButton(
              child: Text(
                'SKIP',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  backgroundColor: Colors.orangeAccent,
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => movie_Homepage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
