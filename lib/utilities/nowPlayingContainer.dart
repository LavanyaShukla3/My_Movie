import 'package:flutter/material.dart';
import 'dart:ui';

class CustomContainer extends StatelessWidget {

  CustomContainer({required this.url, required this.movieTitle});
  final String url;
  final String movieTitle;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
      ),
      child:Align(
        child: Column(
          children: [
            Text(
              movieTitle,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const Text(
              '2023',
              style: TextStyle(
                color: Colors.white,
              ),
            ),

          ],
        ),
      ),
    );
  }
}