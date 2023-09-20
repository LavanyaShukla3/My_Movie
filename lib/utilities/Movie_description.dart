import 'package:flutter/material.dart';
import 'package:my_movie/utilities/Movie_model.dart';
import 'package:my_movie/utilities/api_call.dart';
import 'package:my_movie/utilities/api_info.dart';

//when movie title/image is clicked or when a user searches for a movie
// movie description pages open

class movie_description extends StatefulWidget{
  const movie_description({super.key});

  @override
  State<movie_description> createState() => _movie_descriptionState();
}

class _movie_descriptionState extends State<movie_description> {
  //api
  final movieurl = "https://api.themoviedb.org/3/movie/615656?api_key=${apiKey}";
  List<MovieModel> movie = [];

  Future<void> fetchdata() async {
    //api call
    var movieResponse = await api_Call(movieurl).getData();
    setState(() {
      // to get access to result part from the response
      List<dynamic> movieResponseResults = movieResponse['results'];

      // putting each element in the form of movieModel
      movieResponseResults.forEach((element) {
        movie.add(MovieModel.fromJson(element));

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
