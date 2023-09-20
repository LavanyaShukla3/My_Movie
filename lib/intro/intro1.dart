import 'package:flutter/material.dart';
import 'package:my_movie/intro/introduction.dart';
class intro1 extends StatefulWidget {

  @override
  State<intro1> createState() => _intro1State();
}

class _intro1State extends State<intro1> {
  @override
  Widget build(BuildContext context) {
    return introduction(
      text1:'Engage and share opinion on publish watchlists' ,
      text2: 'Comment on watchlist and share your opinion with the community',
    );
  }
}
