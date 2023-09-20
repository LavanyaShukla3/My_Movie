import 'package:flutter/material.dart';
import 'package:my_movie/intro/introduction.dart';
class intro2 extends StatefulWidget {
  @override
  State<intro2> createState() => _intro2State();
}

class _intro2State extends State<intro2> {
  @override
  Widget build(BuildContext context) {
    return introduction(
      text1:'Customize your watchlist and share it with your friends' ,
      text2: 'No need to worry about forgetting movies for recommendations. Just share your watchlist and you are good to go',
    );
  }
}
