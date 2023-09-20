import 'package:flutter/material.dart';
import 'package:my_movie/utilities/MovieTile.dart';
import 'package:my_movie/utilities/Movie_model.dart';
import 'package:my_movie/utilities/Movie_description.dart';

class buildMovieList extends StatelessWidget {
  buildMovieList({required this.title, required this.movieList});
  final String title;
  final List<MovieModel> movieList;

  @override
  Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       child: ListView.builder(
//         itemCount: movieList == null ? 0 : movieList.length,
//         scrollDirection: Axis.horizontal,
//         shrinkWrap: true,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(builder: (context) => movie_description()),
//               // );
//             },
//             child: Padding(
//               // Adding padding around the list row
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: <Widget>[
//                   // contains name of the row
//                   Row(
//                     children: <Widget>[
//                       //no built-in icon for straight line
//                       Container(
//                         width: 4.0,
//                         height: 16.0, // width of the vertical line
//                         color: Colors.red,
//                       ),
//                       const SizedBox(width: 5.0),
//                       Text(
//                         title,
//                         style: const TextStyle(
//                           fontSize: 16.0,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   Expanded(
//                     child:MovieTile(
//                       movieIndex: index,
//                       movieList: movieList),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        //movie category Title
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              //no built-in icon for straight line
              Container(
                width: 4.0,
                height: 16.0, // width of the vertical line
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

        //List View
        Container(
          height: 200,
          child: ListView.builder(
            itemCount: movieList == null ? 0 : movieList.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => movie_description()),
                  // );
                },
                child: Padding(
                  // Adding padding around the list row
                  padding: const EdgeInsets.all(8.0),
                  child: MovieTile(
                    movieIndex: index,
                    movieList: movieList,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
