import 'package:flutter/material.dart';
import 'package:my_movie/utilities/Movie_model.dart';
import 'package:my_movie/utilities/api_call.dart';


//custom MovieTile widget to showcase info like: name,poster, etc.

class MovieTile extends StatelessWidget {
  //final String movieCategoryTitle;
  final List<MovieModel> movieList;
  final int movieIndex;
  MovieTile(
      {required this.movieList,
      required this.movieIndex,
      //required this.movieCategoryTitle
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
          //column- movie list name
          // Column(
          //   children: <Widget>[
          //     //no built in icon for straight line
          //     Container(
          //       width: 10.0,
          //       height: 2.0,// width of the vertical line
          //       color: Colors.red,
          //     ),
          //     Text(
          //       movieCategoryTitle,
          //       style: const TextStyle(
          //         fontSize: 16.0,
          //         color: Colors.black,
          //       ),
          //     ),
          //   ],
          // ),

          //const SizedBox(height: 10.0),

          // Movie Poster
          Column(children: <Widget>[
            //images
            Expanded(
              flex: 1,
              child: movieList[movieIndex].poster_path != null
                  ?
                  //Container contains image
                  Container(
                      //MediaQuery.of(context).size.width gives the width of the screen.
                      // Making image's width to half of the given screen size
                      width: MediaQuery.of(context).size.width / 4,
                      // //Making image's height to one fourth of the given screen size
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: BoxDecoration(
                        //Making image box slightly curved
                        borderRadius: BorderRadius.circular(10.0),
                        //Setting box's color to grey
                        color: Colors.grey,
                        image: DecorationImage(
                            image: NetworkImage(api_Call.imagePathPrefix +
                                movieList[movieIndex].poster_path),
                            fit: BoxFit
                                .cover), //Image getting all the available space

                        //boxshadow to put shadow on the container
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              //Applying softening effect
                              blurRadius: 3.0,
                              //move 1.0 to right (horizontal), and 3.0 to down (vertical)
                              offset: Offset(1.0, 3.0)),
                        ],
                      ),
                    )
                  : Container(),
            ), //if no picture empty container

            // movie name+ rating
            Column(
              children: <Widget>[
                // Row(
                //     children:<Widget> [
                //       FaIcon(FontAwesomeIcons.star),
                //       Text(
                //         "$MovieList[Movieindex].vote_average",
                //       )
                //     ]
                // ),
                //Movie name
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    movieList[movieIndex].title,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  ),
              ],
            ),
          ]),
        ],
    );
  }
}
