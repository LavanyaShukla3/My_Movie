import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({required this.url, required this.movieTitle, required this.genres});

  final String url;
  final String movieTitle;
  final String genres;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          // Original content here
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Blurred container
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.white, // White at the bottom
                  Colors.white.withOpacity(0.0), // Transparent at the top
                ],
                stops: [0.0, 0.6], // Color stops
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                movieTitle,
                style: GoogleFonts.signika(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                children:<Widget>[
                Text(
                  '2023',
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                ),
              SizedBox(width:4.0),
              FaIcon(FontAwesomeIcons.solidCircle,size: 4.0, color: Colors.black,),
                  SizedBox(width:4.0),

              Text(
                genres, // Display the genre name here
                style: GoogleFonts.nunito(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),),

            ],),
        ],),
    ),
    ]);
  }
}
