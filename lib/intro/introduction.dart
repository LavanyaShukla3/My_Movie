import 'package:flutter/material.dart';
import 'package:my_movie/MyArc.dart';

class introduction extends StatelessWidget {

  const introduction({required this.text1, required this.text2});
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(

      child: Stack(
          children: [
            Container(
      height: 250,
      width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(500),
                bottomRight: Radius.circular(500),
              ),
              color: Color(0xFF75B9BE),
            ),
    ),

            Text(
              text2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                //fontFamily: 'Signika',
              ),
            ),
          ],
      ),
        ),
        Expanded(      //flex: 2,
          child: Container(
            //color: Color(0xFFD0D6B5),
            child:Text(
              text1,
              style: TextStyle(
                fontSize: 25,
                color: Color(0xFF75B9BE),
                //fontFamily: 'Nunito',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
