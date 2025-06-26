import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/models/models.dart';
import 'package:movies_app/models/response_api.dart';

class MoviesProvider extends ChangeNotifier {
  String apiKey = '7d44f451461c8442a0bd7fcb2a95d574';
  String baseUrl = 'api.themoviedb.org';
  String language = 'es-ES';

  List<Pelicula> onDisplayMovies = [];

  MoviesProvider() {
    // print('MoviesProvider inicializado');
    getMoviesDisplay();
  }

  getMoviesDisplay() async {
    var url = Uri.https(baseUrl, '3/movie/now_playing', {
      'api': apiKey,
      'languaje': language,
      'page': 1,
    });
    final response = await http.get(url);
    final newResponse = NewPlayResponse.fromJson(jsonDecode(response.body));
    //decodificar data
    // final Map<String, dynamic> decodeData = jsonDecode(response.body);
    // print(newResponse.results[0].title);
    onDisplayMovies = newResponse.results;
    notifyListeners();
  }
}
