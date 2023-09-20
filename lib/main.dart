import 'package:flutter/material.dart';
import 'package:my_movie/intro/intro1.dart';
import 'package:my_movie/intro/intro2.dart';
import 'package:my_movie/intro/intro3.dart';
import 'package:my_movie/Registeration_Page/register_main.dart';

const yellow =0xFFD19537;
const blue=0xFF1F2F34;

void main() {
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
      home: register_main(),
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