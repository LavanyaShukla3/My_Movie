import 'package:flutter/material.dart';
import 'package:my_movie/registration_page/background_animation.dart';
import 'package:my_movie/movie_db/movie_homepage.dart';
import 'package:my_movie/authentication/google_auth_service.dart';
import 'package:my_movie/authentication/gmail_login.dart';
import 'package:my_movie/authentication/register.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterMain extends StatelessWidget {
  const RegisterMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
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
                  onTap: () => AuthService().signInWithGoogle(),
                  child: Container(
                    margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                    padding:
                        const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
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
                    margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
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
                      builder: (context) => const AlreadyRegistered(),
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
              margin: const EdgeInsets.only(top: 100.0, left: 25.0, right: 25.0),
              child: Column(
                children: <Widget>[
                  const Image(
                    image: AssetImage('images/popcorn.png'),
                    width: 60.0,
                    height: 60.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'MY MOVIE LIST',
                    style: GoogleFonts.ptSansNarrow(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 30.0,
                    ),
                  ),
                  Center(
                    child: Text(
                      'One stop destination for everything movies',
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center, // Center-align the text
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //SKIP

          Align(
            alignment: AlignmentDirectional.topEnd,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MovieHomepage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent, // Set the background color to transparent
              ),
              child: Container(
                //margin: EdgeInsets.only(right: 30.0, top: 30.0),
                padding: const EdgeInsets.only(top: 40.0, right: 0.0),
                color: Colors.transparent,
                child: Text(
                  'SKIP',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 15.0,
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
