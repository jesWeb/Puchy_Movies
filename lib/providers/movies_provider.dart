import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  String apiKey = '7d44f451461c8442a0bd7fcb2a95d574';
  String baseUrl = 'api.themoviedb.org';
  String language = 'es-ES';

  List<Pelicula> onDisplayMovies = [];
  List<Pelicula> popularMovies = [];
  int _PopularPage = 0;

  MoviesProvider() {
    // print('MoviesProvider inicializado');
    getOnDisplayMovies();
    getPopular();
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
    final JsonData = await this._getJsonData('3/movie/now_playing');

    final nowPlayingResponse = NewPlayResponse.fromJson(JsonData);
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  // void getMoviesDisplay() {}

  getPopular() async {
    _PopularPage++;

    final JsonData = await this._getJsonData('3/movie/popular', _PopularPage);
    final popularResponse = PopularResponse.fromJson(JsonData);
    popularMovies = [...popularMovies, ...popularResponse.results];
    // print(popularMovies)
    notifyListeners();
  }
}
