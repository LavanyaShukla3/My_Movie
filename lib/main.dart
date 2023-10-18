import 'package:flutter/material.dart';
import 'package:my_movie/registration_page/register_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_movie/app_theme/app_theme_light.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main()async {

    // Ensure that Flutter is initialized
    WidgetsFlutterBinding.ensureInitialized();
    // Initialize Firebase
    await Firebase.initializeApp();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //skip button in register_main
    bool hasPressedSkip = prefs.getBool('hasPressedSkip') ?? false;

    runApp(MyApp(prefs: prefs, hasPressedSkip: hasPressedSkip));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  final bool hasPressedSkip;

  const MyApp({Key? key, required this.prefs, required this.hasPressedSkip}): super(key: key);

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
      home: RegisterMain(prefs: prefs, hasPressedSkip: hasPressedSkip),
    )
    );
  }
}
