import 'package:flutter/material.dart';
import 'package:my_movie/registration_page/background_animation.dart';
import 'package:my_movie/movie_db/movie_homepage.dart';
import 'package:my_movie/authentication/google_auth_service.dart';
import 'package:my_movie/authentication/welcome_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_movie/utilities/custom_authetication_button.dart';
import 'package:my_movie/utilities/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  child: const CustomAutheticationButton(colour: Colors.white,image: 'images/google.png', text: 'SIGN IN WITH GOOGLE',textcolour: Colors.black),
                ),
                const SizedBox(height: 15.0),

                //email login
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WelcomePage(text:'sign in', confirmPassword:false, name: false),
                    ),
                  ), // Replace with the actual screen you want to navigate to),
                  child: const CustomAutheticationButton(colour: Colors.transparent,image: 'images/email.png', text: 'SIGN UP WITH EMAIL',textcolour: Colors.white),
                ),
                const SizedBox(height: 15.0),

                //already have an account
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomePage(text: 'sign Up', confirmPassword: true, name: true),
                      ),
                    );
                  },
                  // Replace with the actual screen you want to navigate to),
                  child: Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 15.sp,
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
                    style: textTheme.displayLarge,
                  ),
                  Center(
                    child: Text(
                      'One stop destination for everything movies',
                      style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 18.sp,
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
                padding: const EdgeInsets.only(top: 44.0, right: 5.0),
                color: Colors.transparent,
                child: Text(
                  'SKIP',
                  style: textTheme.bodyLarge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
