//este archivo sirve para maper los datos que llega de al api pero lo usaremos como modelo
import 'dart:convert';

import 'movie.dart';

class NewPlayResponse {
  Dates dates;
  int page;
  List<Pelicula> results;
  int totalPages;
  int totalResults;

  NewPlayResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory NewPlayResponse.fromRawJson(String str) =>
      NewPlayResponse.fromJson(json.decode(str));

  factory NewPlayResponse.fromJson(Map<String, dynamic> json) =>
      NewPlayResponse(
        dates: Dates.fromJson(json["dates"]),
        page: json["page"],
        results: List<Pelicula>.from(
          json["results"].map((x) => Pelicula.fromJson(x)),
        ),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  // Map<String, dynamic> toJson() => {
  //   "dates": dates.toJson(),
  //   "page": page,
  //   "results": List<dynamic>.from(results.map((x) => x.toJson())),
  //   "total_pages": totalPages,
  //   "total_results": totalResults,
  // };
}

class Dates {
  Dates({required this.maximum, required this.minimum});

  DateTime maximum;
  DateTime minimum;

  factory Dates.fromRawJson(String str) => Dates.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
    maximum: DateTime.parse(json["maximum"]),
    minimum: DateTime.parse(json["minimum"]),
  );

  Map<String, dynamic> toJson() => {
    "maximum":
        "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
    "minimum":
        "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
  };
}
