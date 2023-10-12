import 'package:flutter/material.dart';
import 'package:my_movie/registration_page/register_main.dart';
import 'package:firebase_core/firebase_core.dart';

const yellow =0xFFD19537;
const blue=0xFF1F2F34;

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
    return MaterialApp(
      // theme: ThemeData(
      //   scaffoldBackgroundColor: Color(0xFFD0D6B5),
      //     backgroundColor: Color(0xFFD0D6B5),
      //   primaryColor: Color(0xFFD0D6B5),
      // ),
      theme: ThemeData.light(),
      home: const RegisterMain(),
    );
  }
}
// home: PageViewClass(),
// class PageViewClass extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//         itemCount: 3, // Number of pages
//         itemBuilder: (context, index) {
//       switch (index) {
//       case 0:
//       return intro1();
//       case 1:
//       return intro2();
//       case 2:
//       return intro3();
//       default:
//       return Container();
//       }
//         },
//     );
//   }
// }
//