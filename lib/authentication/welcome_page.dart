import 'package:flutter/material.dart';
import 'package:my_movie/authentication/common_auth.dart';
import 'package:my_movie/utilities/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends StatelessWidget {
  final String text;
  final bool confirmPassword;
  final bool name;

  WelcomePage({required this.text, required this.confirmPassword, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 60.sp, left: 8.sp),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      text,
                      style: textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      Text('Welcome to', style: TextStyle(fontSize: 22.sp)),
                      const SizedBox(width: 4.0),
                      Text(
                        'MyMovieList',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 22.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50.0),
          CommonAuthPage(
            showConfirmPassword: confirmPassword,
            text1: 'LOGIN',
            text2: 'REGISTER',
            subtext1: "Don't have an account? Sign Up",
            subtext2: "Already have an account?",
              showName: name,
          ),
        ],
      ),
    );
  }
}
