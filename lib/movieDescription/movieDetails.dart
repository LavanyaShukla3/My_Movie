// import 'package:flutter/material.dart';
//
// //Includes the poster,backdrop,movie name, release year, run time and rating
// //will remain constant while scrolling pages
//
// class movieDetails extends StatelessWidget {
//   const movieDetails({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         //container to store backdrop
//         Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height / 5,
//           decoration: BoxDecoration(
//             image: Image.network(backdrop_path),
//           ),
//         ),
//
//         //container to store the poster,movie name, release year, runtime
//         Expanded(
//             child: Row(children: <Widget>[
//           //container to hold poster
//           Container(
//             width: MediaQuery.of(context).size.width / 4,
//             height: MediaQuery.of(context).size.height / 3,
//             decoration: BoxDecoration(
//               //image: Image.network(poster_path),
//             ),
//           ),
//
//           //container to hold,movie name, release year, runtime and rating
//           Container(
//             child: Column(children: <Widget>[
//               //movie title
//               Text(
//                 //original_title,
//                 style: TextStyle(
//                   fontSize: 28.0,
//                 ),
//               ),
//               //release year, runtime and rating
//               Row(children: <Widget>[
//                 //Text(release_date),
//                 Text(
//                   '.',
//                   style: TextStyle(
//                     fontSize: 18.0,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 Text(runtime),
//               ]),
//             ]),
//           ),
//         ])),
//         //container to show rating
//         Row(children: <Widget>[
//           //tmdb logo
//           Container(
//             height: 10.0,
//             width: 20.0,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('images/TmdbLogo.png'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           //review
//           Column(
//             children:<Widget>[
//               Text(vote_count),
//               Text(vote_average),
//             ],
//           ),
//         ])
//       ],
//     );
//   }
// }
