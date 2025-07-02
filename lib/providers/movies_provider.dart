import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String apiKey = '7d44f451461c8442a0bd7fcb2a95d574';
  String baseUrl = 'api.themoviedb.org';
  String language = 'es-ES';

  List<Pelicula> onDisplayMovies = [];
  List<Pelicula> popularMovies = [];

  MoviesProvider() {
    // print('MoviesProvider inicializado');
    getOnDisplayMovies();
    getPopular();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(baseUrl, '3/movie/now_playing', {
      'api_key': apiKey,
      'language': language,
      'page': '1',
    });
    final response = await http.get(url);

    final nowPlayingResponse = NewPlayResponse.fromJson(response.body);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  // void getMoviesDisplay() {}

  getPopular() async {
    var url = Uri.https(baseUrl, '3/movie/popular', {
      'api_key': apiKey,
      'language': language,
      'page': '1',
    });

    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);
    popularMovies = [...popularMovies, ...popularResponse.results];
    // print(popularMovies)
    notifyListeners();
  }
}
