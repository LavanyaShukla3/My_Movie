import 'package:flutter/material.dart';
import 'package:my_movie/utilities/movieModel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_movie/utilities/api_call.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieTile extends StatelessWidget {
  final List<MovieModel> movieList;
  final int movieIndex;

  MovieTile({
    required this.movieList,
    required this.movieIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              api_Call.imagePathPrefix + movieList[movieIndex].poster_path,
              fit: BoxFit.cover, // Adjust the fit mode as needed
            ),
          ),
          const SizedBox(height: 5.0),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const FaIcon(
                        FontAwesomeIcons.solidStar,
                        size: 13,
                        color: Color.fromARGB(255, 255, 204, 0),
                      ),
                      SizedBox(width: 7),
                      Text(
                        movieList[movieIndex].vote_average.toString(),
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5.0),
                  GestureDetector(
                    child: const Icon(
                      Icons.more_vert_rounded,
                      color: Colors.black,
                      size: 19.0,
                    ),
                  ),
                ],
              ),
              // Add spacing between star/rating and movie title
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  movieList[movieIndex].title,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
