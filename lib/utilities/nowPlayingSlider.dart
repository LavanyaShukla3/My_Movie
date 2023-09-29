import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_movie/utilities/nowPlayingContainer.dart';
import 'package:my_movie/utilities/api_call.dart';
import 'package:my_movie/utilities/api_info.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//creates a 10 slide animation os now in theatres movies
class NowPlayingMovies extends StatefulWidget {
  @override
  State<NowPlayingMovies> createState() => _NowPlayingMoviesState();
}

class _NowPlayingMoviesState extends State<NowPlayingMovies> {
  List<String> posterPaths = [];
  List<String> movieTitles = [];
  List<dynamic> genres=[];
  late List<String> genreNames;


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
                    String genreName = genreNames.length > index ? genreNames[index] : "";
                    return CustomContainer(
                      url: Api_Info.imagePathPrefix + posterPath,
                      movieTitle: movieTitle,
                      genres: genreName,
                    );
                  }).toList(),
                  options: CarouselOptions(
                    //height: MediaQuery.of(context).size.width *2/2 ,
                    height: MediaQuery.of(context).size.height/3,
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
            return Center(
              child: const CircularProgressIndicator(
                color: Colors.red,),
            ); // Replace with your loading indicator
          }
        },
      ),
    );
  }

  Future<void> fetchmovies() async {
    String nowPlayingUrl = Api_Info.nowPlayingMovies;
    var nowPlayingResponse = await api_Call(nowPlayingUrl).getData();
    List<dynamic> nowPlayingResults = nowPlayingResponse['results'];

    posterPaths.clear();
    movieTitles.clear();

    //storing 1st 10 movie posters in the list
    for (int i = 0; i < 10 && i < nowPlayingResults.length; i++) {
      var posterPath = nowPlayingResults[i]['poster_path'];
      var movieTitle = nowPlayingResults[i]['original_title'];
      var genre = nowPlayingResults[i]['genre_ids'];

      if (posterPath != null && movieTitle != null) {
        posterPaths.add(posterPath);
        movieTitles.add(movieTitle);
        genres.add(genre);
      }
    }

    genreNames = genres.map((genreIds) {
      // Use the genreMap to get genre names for each ID in the list
      List<String> genreList = genreIds.map<String>((genreId) {
        return Api_Info.genreMap[genreId] ?? 'Unknown';
      }).toList();
      // Join the genre names into a comma-separated string
      return genreList.join(', ');
    }).toList();
  }



  @override
  void initState() {
    super.initState();
    fetchmovies();
  }
}