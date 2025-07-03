import 'dart:convert';

import 'package:movies_app/models/movie.dart';

class SearchResponse {
  int page;
  List<Pelicula> results;
  int totalPages;
  int totalResults;

  SearchResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SearchResponse.fromJson(String str) =>
      SearchResponse.fromMap(json.decode(str));

  factory SearchResponse.fromMap(Map<String, dynamic> json) => SearchResponse(
    page: json["page"],
    results: List<Pelicula>.from(json["results"].map((x) => Pelicula.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );
}
