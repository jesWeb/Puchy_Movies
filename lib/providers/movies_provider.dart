import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String apiKey = '7d44f451461c8442a0bd7fcb2a95d574';
  String baseUrl = 'api.themoviedb.org';
  String language = 'es-ES';

  List<Pelicula> onDisplayMovies = [];
  List<Pelicula> popularMovies = [];
  int _popularPage = 0;

  Map<int, List<Cast>> movieCast = {};

  MoviesProvider() {
    // print('MoviesProvider inicializado');
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String ednpoint, [int page = 1]) async {
    var url = Uri.https(baseUrl, ednpoint, {
      'api_key': apiKey,
      'language': language,
      'page': '$page',
    });
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');

    final nowPlayingResponse = NewPlayResponse.fromJson(jsonData);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  // void getMoviesDisplay() {}

  getPopularMovies() async {
    _popularPage++;

    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];
    // print(popularMovies)
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (movieCast.containsKey(movieId)) {
      return movieCast[movieId]!;
    }
    //:Revisar MAPA
    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    movieCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }
}
