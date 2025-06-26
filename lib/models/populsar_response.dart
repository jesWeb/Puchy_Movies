import 'dart:convert';

import 'package:movies_app/models/movie.dart';

class PopularResponse {

  PopularResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    int page;
    List<Pelicula> results;
    int totalPages;
    int totalResults;

    factory PopularResponse.fromJson(String str) => PopularResponse.fromMap(json.decode(str));


    factory PopularResponse.fromMap(Map<String, dynamic> json) => PopularResponse(
        page: json["page"],
        results: List<Pelicula>.from(json["results"].map((x) => Pelicula.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}
