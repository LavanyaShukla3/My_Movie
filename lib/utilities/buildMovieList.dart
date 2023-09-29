import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_movie/utilities/movieTile.dart';
import 'package:my_movie/utilities/movieModel.dart';

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
          padding: const EdgeInsets.only(bottom: 22.0, left: 8.0),
          child: Row(
            children: <Widget>[
              // No built-in icon for a straight line
              Container(
                width: 6.0,
                height: 32.0, // Width of the vertical line
                color: Colors.red,
              ),
              const SizedBox(width: 10.0),
              // movie list name
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        // Handle the 'VIEW ALL' tap event here
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Text(
                          'VIEW ALL',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // List View
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: ListView.builder(
            itemCount: movieList == null ? 0 : movieList.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemExtent: 120.0,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Handle the movie item tap event here
                },
                child: MovieTile(movieIndex: index, movieList: movieList),
              );
            },
          ),
        ),
      ],
    );
  }
}
