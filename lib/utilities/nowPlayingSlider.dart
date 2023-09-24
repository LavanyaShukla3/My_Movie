import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_movie/utilities/nowPlayingContainer.dart';
import 'package:my_movie/utilities/api_call.dart';
import 'package:my_movie/utilities/api_info.dart';

//creates a 10 slide animation os now in theatres movies
class NowPlayingMovies extends StatefulWidget {
  @override
  State<NowPlayingMovies> createState() => _NowPlayingMoviesState();
}

class _NowPlayingMoviesState extends State<NowPlayingMovies> {
  //list to store 10 poster path
  List<String> posterPaths = [];

  List<String> movieTitles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: fetchmovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Data has been fetched, so build the CarouselSlider
            return ListView(
              children: [
                CarouselSlider(
                  items: posterPaths.asMap().entries.map((entry) {
                    int index = entry.key;
                    String posterPath = entry.value;
                    String movieTitle = movieTitles.length > index ? movieTitles[index] : "";
                    return CustomContainer(
                      url: Api_Info.imagePathPrefix + posterPath,

                      movieTitle: movieTitle,
                    );
                  }).toList(),
                  options: CarouselOptions(
                    //height: MediaQuery.of(context).size.width *2/2 ,
                    height: 400.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    // to fix the zoom in ration in poster
                    aspectRatio: 3 / 2,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    //continous rolling
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    // viewport determines - the visible portion each item occupies
                    viewportFraction: 1.0,
                  ),
                ),
              ],
            );
          } else {
            // Data is still loading, you can show a loading indicator or other content
            return const CircularProgressIndicator(); // Replace with your loading indicator
          }
        },
      ),
    );
  }

  Future<void> fetchmovies() async {
    String nowPlayingUrl = Api_Info.nowPlayingMovies;
    var nowPlayingResponse = await api_Call(nowPlayingUrl).getData();
    List<dynamic> nowPlayingResults = nowPlayingResponse['results'];

    //storing 1st 10 movie posters in the list
    for (int i = 0; i < 10 && i < nowPlayingResults.length; i++) {
      var posterPath = nowPlayingResults[i]['poster_path'];
      var movieTitle = nowPlayingResults[i]['original_title'];
      if (posterPath != null && movieTitle != null) {
        posterPaths.add(posterPath);
        movieTitles.add(movieTitle);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchmovies();
  }
}
