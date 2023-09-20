import 'package:flutter/material.dart';
import 'package:my_movie/intro/introduction.dart';

class intro3 extends StatefulWidget {
  @override
  State<intro3> createState() => _intro3State();
}

class _intro3State extends State<intro3> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          introduction(
      text1:'Keep yourself updated with the latest movies and trends' ,
      text2: 'Get al the details on upcoming movies as well as for the thousands of movies of movies in our database',
    ),
          ElevatedButton(
              onPressed: (){},
              child: Text('Get Started'),
          ),
    ],
    );
  }
}
