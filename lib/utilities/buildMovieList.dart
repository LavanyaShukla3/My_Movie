import 'package:flutter/material.dart';
import 'package:my_movie/utilities/movieTile.dart';
import 'package:my_movie/utilities/movieModel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_movie/utilities/api_call.dart';
import 'package:my_movie/MovieDescription/moviedescriptionbasepage.dart';

class buildMovieList extends StatelessWidget {
  buildMovieList({required this.title, required this.movieList});
  final String title;
  final List<MovieModel> movieList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Movie category Title
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              // No built-in icon for a straight line
              Container(
                width: 4.0,
                height: 16.0, // Width of the vertical line
                color: Colors.red,
              ),
              const SizedBox(width: 5.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10.0),

        // List View
        SizedBox(
          //popular movie as a complete list's dimension

          //had to set height to prevent: Horizontal viewport was given unbounded height
          //width: MediaQuery.of(context).size.width, //optional. will work the same w/o it also
          height: MediaQuery.of(context).size.height /3,
          child: ListView.builder(
            itemCount: movieList == null ? 0 : movieList.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
              //item extent:to specify the fixed extent (height or width) of each item in the list.

            // in this case, it determines the width
              itemExtent: 120.0,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => movie_description()),
                  // );
                },
                // child: Padding(
                //   // Adding padding around the list row
                //   padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children:<Widget>[
                    MovieTile(movieIndex: index, movieList: movieList),
                      // Row(
                      //   children: <Widget>[
                      //     const FaIcon(
                      //       FontAwesomeIcons.solidStar,
                      //       size: 13,
                      //       color: Colors.amberAccent,
                      //     ),
                      //     SizedBox(width: 7),
                      //     Text(
                      //       movieList[index].vote_average.toString(),
                      //       style: const TextStyle(
                      //         fontSize: 14,
                      //         color: Colors.black,
                      //         fontWeight: FontWeight.w300,
                      //       ),
                      //     )
                      //   ],
                      // ),
                      // Text(
                      //   movieList[index].title,
                      //   style: const TextStyle(
                      //     fontSize: 14,
                      //     color: Colors.black,
                      //     fontWeight: FontWeight.w300,
                      //   ),
                      //   softWrap: false,
                      //   overflow: TextOverflow.ellipsis,
                      //   maxLines: 3,
                      // ),
                  ]),

                //),
              );
            },
          ),
        ),
      ],
    );
  }
}
