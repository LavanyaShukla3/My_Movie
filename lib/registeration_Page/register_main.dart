import 'package:flutter/material.dart';
import 'package:my_movie/Registeration_Page/background_Animation.dart';
import 'package:my_movie/moviedb/moviehomepage.dart';
import 'package:my_movie/authentication/googleauth_service.dart';
import 'package:my_movie/authentication/gmailLogin.dart';
import 'package:my_movie/authentication/register.dart';


class register_main extends StatelessWidget {
  const register_main({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BackgroundAnimation(),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Column(
              children: <Widget>[
                //google sig-in
                GestureDetector(
                  onTap: () => Auth_service().signInWithGoogle(context),

                  child: Container(
                    margin: EdgeInsets.only(left: 30.0, right: 30.0),
                    padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      color: Colors.white,
                    ),
                    child: const Row(
                      children: <Widget>[
                        Image(
                          image: AssetImage('images/google.png'),
                          width: 40.0,
                          height: 40.0,
                        ),
                        SizedBox(width: 49),
                        Text(
                          'SIGN IN WITH GOOGLE',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),

                //email login
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  ), // Replace with the actual screen you want to navigate to),
                  child: Container(
                    margin: EdgeInsets.only(left: 30.0, right: 30.0),
                    padding:
                        EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    child: const Row(
                      children: <Widget>[
                        Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(width: 69),
                        Text(
                          'SIGN UP WITH EMAIL',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        // Use `width` here, not `height
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),

                //already have an account
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AlreadyRegistered(),
                    ),
                  ), // Replace with the actual screen you want to navigate to),
                  child: const Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.0,
                        ),
                      ),
                ),
              ],
            ),
          ),

          //movie icon
          Center(
            child: Container(
                margin: EdgeInsets.only(top: 60.0),
                child: const Column(children: <Widget>[
                  Image(
                    image: AssetImage('images/popcorn.png'),
                    width: 100.0,
                    height: 100.0,
                  ),
                  Text(
                    'MY MOVIE LIST',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                  Text(
                    'One stop destination for everything movies',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ])),
          ),

          //SKIP

          Align(
            alignment: AlignmentDirectional.topEnd,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => movie_Homepage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors
                    .transparent, // Set the background color to transparent
              ),
              child: Container(
                //margin: EdgeInsets.only(right: 30.0, top: 30.0),
                padding: const EdgeInsets.only(top: 30.0, right: 30.0),
                color: Colors.transparent,
                child: const Text(
                  'SKIP',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
