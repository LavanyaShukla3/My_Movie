import 'package:flutter/material.dart';
import 'package:my_movie/utilities/api_info.dart';
import 'package:my_movie/utilities/api_call.dart';
import 'package:my_movie/utilities/movieModel.dart';
import 'package:my_movie/utilities/buildMovieList.dart';
import 'package:my_movie/utilities/appbar.dart';
import 'package:my_movie/utilities/IconButton.dart';
import 'package:my_movie/utilities/nowPlayingSlider.dart';

//movie homepage where list of movie present
// has options to search/navigate and create watchlist

class movie_Homepage extends StatefulWidget {
  const movie_Homepage({super.key});

  @override
  State<movie_Homepage> createState() => _movie_HomepageState();
}

class _movie_HomepageState extends State<movie_Homepage> {
  final popular =
      "http://api.themoviedb.org/3/discover/movie?api_key=${Api_Info.apiKey}&sort_by=popularity.desc";
  final upcoming =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Api_Info.apiKey}";
  final TopRated =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Api_Info.apiKey}";

  //result from api fetch data
  // var popularMovies;
  // var upcomingMovies;
  // var TopRatedMovies;

  List<MovieModel> popularMoviesList = [];
  List<MovieModel> upcomingMoviesList = [];
  List<MovieModel> TopRatedMoviesList = [];

  Future<void> fetchmovies() async {
    //to get info from tmdb
    var popularMovieResponse = await api_Call(popular).getData();
    var upcomingMovieResponse = await api_Call(upcoming).getData();
    var TopRatedMovieResponse = await api_Call(TopRated).getData();

    setState(() {
      // to get access to result part from the reponse
      List<dynamic> popularMoviesResults = popularMovieResponse['results'];
      List<dynamic> upcomingMoviesResults = upcomingMovieResponse['results'];
      List<dynamic> TopRatedMoviesResults = TopRatedMovieResponse['results'];

      //putting each element in form movieModel
      popularMoviesResults.forEach((element) {
        popularMoviesList.add(MovieModel.fromJson(element));
      });
      upcomingMoviesResults.forEach((element) {
        upcomingMoviesList.add(MovieModel.fromJson(element));
      });
      TopRatedMoviesResults.forEach((element) {
        TopRatedMoviesList.add(MovieModel.fromJson(element));
      });
    });
  }

  //to perform api call each time the page is opened
  @override
  void initState() {
    super.initState();
    fetchmovies();
  }

  @override
  Widget build(BuildContext context) {
    //calling fetchmovies() inside the build() method can lead to an undesirable behavior.
    // The build() method should be used solely for building the UI and not for initiating asynchronous operations.
    //fetchmovies();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(appBarTitle: 'mymovielist', icon: Icons.search),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
                  child: Column(children: <Widget>[
            //now playing movie slider
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: NowPlayingMovies(),
            ),
            // Popular Movies
            buildMovieList(
                title: "Popular Movies", movieList: popularMoviesList),

                    const SizedBox(height: 20.0),
            // Upcoming Movies
            buildMovieList(
                title: "Upcoming Movies", movieList: upcomingMoviesList),


                    const SizedBox(height: 20.0),
            // Top Rated Movies
            buildMovieList(
                title: "Top Rated Movies", movieList: TopRatedMoviesList),
          ]))),
          Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50.0,
                    color: const Color.fromARGB(255, 245, 251, 254),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          IconButtons(page: "movie_Homepage", icon: "home"),
                          //SizedBox(width: 80),
                          IconButtons(page: "searchPage", icon: "search"),
                          //SizedBox(width: 80),
                          IconButtons(
                              page: "navigationPage",
                              icon: "assistant_navigation"),
                          //SizedBox(width: 80),
                          IconButtons(page: "listPage", icon: "list"),
                          //SizedBox(width: 80),
                          IconButtons(
                              page: "userInfoPage",
                              icon: "supervised_user_circle"),
                        ]),
                  ))),
        ],
      ),
    );
  }
}
