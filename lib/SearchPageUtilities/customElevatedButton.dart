import 'package:flutter/material.dart';
import 'package:my_movie/Movie_db/searchPage.dart';

//custom button - container of fixed size that detect gestures.
//gesture detector is placed on the enrire container.
//container divided into two - pic+genre text

import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  //final String image;
  final String genre;
  final String colour;
  final String OnTap;

  CustomButton({
    //required this.image,
    required this.genre,
    required this.OnTap,
    required this.colour,
  });

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          colors: _getColor(),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => _OnTap(),
          //   ),
          // );
        },
        child: Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left:5.0, right: 5.0)),
            Text(
              widget.genre,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            //Image.asset(widget.image, fit: BoxFit.none),
          ],
        ),
      ),
    );
  }

  // Widget _OnTap() {
  //   switch (widget.OnTap) {
  //     case "Sci-fi":
  //       return scifi();
  //     case "Romance":
  //       return romance();
  //     case "Detective":
  //       return mystery();
  //     case "Horror":
  //       return horror();
  //     case "Action":
  //       return action();
  //     default:
  //       return searchPage(); // Default to movie_Homepage if not recognized
  //   }
  // }

  List<Color> _getColor() {
    switch (widget.colour) {
      case "red":
        //return [Color.fromARGB(255, 255, 0, 0), Colors.red[300]];
        return [Color.fromARGB(255, 255, 0, 0), Color.fromARGB(255, 245, 140, 154)];
      case "pink":
        return [Color.fromARGB(255, 255, 0, 127), Color.fromARGB(255, 245, 176, 232)];
        //return [Color.fromARGB(255, 255, 0, 127), Colors.pink[100]];
      case "blue":
        return [Color.fromARGB(255, 153, 153, 255), Color.fromARGB(255, 204, 204, 255)];
        //return [Color.fromARGB(255, 153, 153, 255), Colors.indigo[100]];
      case "green":
        return [Color.fromARGB(255, 0,204, 102), Color.fromARGB(255, 51, 255, 153)];
        //return [Color.fromARGB(255, 0, 204, 102), Colors.lightGreen[500]];
      case "teal":
        //return [Color.fromARGB(255, 76, 153, 0), Colors.lightGreen[900]];
        return [Color.fromARGB(255, 76, 153, 0), Color.fromARGB(255, 118, 161, 40)];
      case "grey":
        return [Color.fromARGB(255, 160, 160, 160), Color.fromARGB(255, 224, 224, 224)];
        //return [Color.fromARGB(255, 160, 160, 160), Colors.grey[400]];
      default:
        //return [Color.fromARGB(255, 160, 160, 160), Colors.grey[400]];
        return [Color.fromARGB(255, 160, 160, 160), Color.fromARGB(255, 224, 224, 224)];
    }
  }
}
