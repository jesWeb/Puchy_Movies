//este archivo sirve para maper los datos que llega de al api pero lo usaremos como modelo
import 'dart:convert';

import 'movie.dart';

class NewPlayResponse {
  NewPlayResponse({
        required this.dates,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    Dates dates;
    int page;
    List<Pelicula> results;
    int totalPages;
    int totalResults;

    factory NewPlayResponse.fromJson(String str) => NewPlayResponse.fromMap(json.decode(str));

    factory NewPlayResponse.fromMap(Map<String, dynamic> json) => NewPlayResponse(
        dates       : Dates.fromMap(json["dates"]),
        page        : json["page"],
        results     : List<Pelicula>.from( json["results"].map((x) => Pelicula.fromMap(x))),
        totalPages  : json["total_pages"],
        totalResults: json["total_results"],
    );
}

class Dates {
    Dates({
        required this.maximum,
        required this.minimum,
    });

    DateTime maximum;
    DateTime minimum;

    factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

    factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );
}