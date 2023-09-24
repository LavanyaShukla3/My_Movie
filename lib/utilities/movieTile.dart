import 'package:flutter/material.dart';
import 'package:my_movie/utilities/movieModel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_movie/utilities/api_call.dart';

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
      height: MediaQuery.of(context).size.height/3,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                // Set the border radius
                child: Image.network(
                  api_Call.imagePathPrefix + movieList[movieIndex].poster_path,
                  fit: BoxFit.cover, // Adjust the fit mode as needed
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                Row(
                children: <Widget>[
                  const FaIcon(
                    FontAwesomeIcons.solidStar,
                    size: 13,
                    color: Colors.amberAccent,
                  ),
                  SizedBox(width: 7),
                  Text(
                    movieList[movieIndex].vote_average.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  ]),
                  // Add spacing between star/rating and movie title
                  Flexible(
                    child: Text(
                      movieList[movieIndex].title,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
