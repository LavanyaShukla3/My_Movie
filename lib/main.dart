import 'package:flutter/material.dart';
import 'package:my_movie/registration_page/register_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_movie/app_theme/app_theme_light.dart';

void main()async {

    // Ensure that Flutter is initialized
    WidgetsFlutterBinding.ensureInitialized();
    // Initialize Firebase
    await Firebase.initializeApp();
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390,844),
    builder: (context, widget) => MaterialApp(

      theme: ThemeData.light().copyWith(
        primaryColor: AppThemeLight().colorPrimary,
        scaffoldBackgroundColor: AppThemeLight().colorSecondary,
    ),
      home: const RegisterMain(),
    )
    );
  }
}
